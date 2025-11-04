# n8n Community Edition Bootstrap

Quick and dirty setup of n8n Community Edition for evaluation and demonstration purposes.

Intended for evaluation purposes or simple testing from your cloud provider of choosing.

## What This Deploys

- Ubuntu instance (AWS EC2, DigitalOcean Droplet, or GCP Compute Engine)
- Docker runtime
- n8n CE container running on port 5678
- n8n tunnel mode enabled for quick access

## Prerequisites

- Terraform >= 1.13.0
- Either one of these:
  - AWS credentials [configured](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html)
  - DigitalOcean Personal Access Token [token](https://docs.digitalocean.com/reference/api/create-personal-access-token/)
  - GCP [authenticated](https://cloud.google.com/sdk/gcloud/reference/alpha/auth/application-default/login)

## Quick Start

### AWS

```bash
cd terraform/aws
terraform init
terraform apply -auto-approve
```

Use AWS Session Manager to connect to your EC2

```bash
docker logs n8n
```

### DigitalOcean

```bash
cd terraform/do
terraform init
terraform apply -auto-approve -var="do_token=YOUR_DO_TOKEN"
```

Use Digital Ocean Console to connect to your Droplet

### Google Cloud Platform

```bash
cd terraform/gcp
terraform init
terraform apply -auto-approve
```

Use gcloud to connect to your instance and check logs:

```bash
gcloud compute ssh n8n-server --zone=asia-southeast1-a --project=<your_project_id>
```

If you encounter organization policy errors regarding external IPs, reset the policy:

```bash
gcloud org-policies reset constraints/compute.vmExternalIpAccess --project=<your_project_id>
```

## Setup Details

The deployment automatically:

1. Installs Docker on the instance
2. Pulls the n8n Docker image
3. Starts n8n with persistent volume storage
4. Configures n8n with tunnel mode for external access

Setup logs are available at `/var/log/n8n-setup.log` on the instance.

You can follow the setup log by running this:

```bash
tail -f /var/log/n8n-setup.log
```

And check the docker status with to get the tunnel url:

```bash
docker logs n8n
```

## Notes

- This is not production-ready
- No SSL/TLS configuration included
- Uses n8n tunnel mode (not suitable for production)
- Default timezone set to `Asia/Singapore`

## Cleanup

This cleanup all infrastructure resources

```bash
cd terraform/<your_cloud_provider>
terraform destroy -auto-approve
```
