#!/bin/bash

# Log output to file
exec > >(tee /var/log/n8n-setup.log)
exec 2>&1

echo "Starting n8n setup at $(date)"

# Update package list (quick operation)
apt-get update

# Install required packages
apt-get install -y \
  apt-transport-https \
  ca-certificates \
  curl \
  software-properties-common \
  gnupg

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker repository
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list >/dev/null

# Update package list with Docker repository
apt-get update

# Install Docker
apt-get install -y docker-ce docker-ce-cli containerd.io

# Start Docker service
systemctl start docker
systemctl enable docker

echo "Docker installed, starting n8n setup in background"

# Run the rest in background to avoid blocking cloud-init
cat <<'EOSCRIPT' >/root/setup-n8n.sh
#!/bin/bash
exec >> /var/log/n8n-setup.log 2>&1

echo "Background n8n setup started at $(date)"

# Wait for network to be fully ready
echo "Waiting for network connectivity..."
until curl -s --max-time 5 https://www.google.com > /dev/null 2>&1; do
  echo "Network not ready, waiting..."
  sleep 5
done
echo "Network is ready at $(date)"

# Wait for DNS resolution
echo "Waiting for DNS resolution..."
until nslookup docker.n8n.io > /dev/null 2>&1; do
  echo "DNS not ready, waiting..."
  sleep 5
done
echo "DNS is ready at $(date)"

# Create docker volume
docker volume create n8n_data

# Pull n8n Docker image
docker pull docker.n8n.io/n8nio/n8n

# Additional wait after image pull to ensure network is stable
echo "Waiting 10 seconds for network stability..."
sleep 10

# Start n8n container
docker run -d \
  --name n8n \
  --restart unless-stopped \
  -p 5678:5678 \
  -e GENERIC_TIMEZONE="Asia/Singapore" \
  -e TZ="Asia/Singapore" \
  -e N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=true \
  -e N8N_RUNNERS_ENABLED=true \
  -e N8N_SECURE_COOKIE=false \
  -e N8N_EXPRESS_TRUST_PROXY=true \
  -e N8N_PROXY_HOPS=1 \
  -v n8n_data:/home/node/.n8n \
  docker.n8n.io/n8nio/n8n \
  start --tunnel

echo "n8n container started at $(date)"
echo "Check status: docker logs n8n"
EOSCRIPT

chmod +x /root/setup-n8n.sh

# Run in background and detach
nohup /root/setup-n8n.sh &

echo "User data script completed at $(date), n8n setup running in background"
echo "Monitor progress: tail -f /var/log/n8n-setup.log"
