# n8n Community Edition Bootstrap

Quick and dirty setup of n8n Community Edition for evaluation and demonstration purposes. Intended for training sessions and testing.

## What This Deploys

- Ubuntu instance (AWS EC2 or DigitalOcean Droplet)
- Docker runtime
- n8n CE container running on port 5678
- n8n tunnel mode enabled for quick access

## Prerequisites

- Terraform >= 1.13.0
- AWS credentials configured (for AWS deployment)
- DigitalOcean API token (for DO deployment)

## Quick Start

### AWS Deployment

```bash
cd terraform/aws
terraform init
terraform plan
terraform apply
```

Use AWS Session Manager to connect to your EC2

Access n8n via the tunnel URL shown in container logs:

```bash
docker logs n8n
```

### DigitalOcean Deployment

```bash
cd terraform/do
terraform init
terraform plan -var="do_token=YOUR_DO_TOKEN"
terraform apply -var="do_token=YOUR_DO_TOKEN"
```

Use Digital Ocean Console to connect to your Droplet

Access n8n via the tunnel URL shown in container logs:

```bash
docker logs n8n
```

## Setup Details

The deployment automatically:

1. Installs Docker on the instance
2. Pulls the n8n Docker image
3. Starts n8n with persistent volume storage
4. Configures n8n with tunnel mode for external access

Setup logs are available at `/var/log/n8n-setup.log` on the instance.

## Notes

- This is not production-ready
- No SSL/TLS configuration included
- Uses n8n tunnel mode (not suitable for production)
- Default timezone set to Asia/Singapore
- Modify `scripts/n8n-userdata.sh` to customize n8n configuration

## Cleanup

```bash
terraform destroy
```
