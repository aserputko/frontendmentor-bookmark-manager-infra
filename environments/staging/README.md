# Staging Environment

This directory contains Terraform configuration for the staging environment.

## Usage

From this directory, initialize and apply Terraform:

```bash
terraform init
terraform plan
terraform apply
```

## Variables

See `terraform.tfvars` for environment-specific variable values.

## Prerequisites

- Terraform >= 1.5.0
- AWS CLI configured with appropriate credentials
- Access to AWS staging account

