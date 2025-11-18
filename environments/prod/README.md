# Production Environment

This directory contains Terraform configuration for the production environment.

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
- Access to AWS production account
- Manual approval required for all changes

## Important Notes

- All changes require manual approval
- Multi-AZ deployment is mandatory
- Enhanced monitoring and alerting enabled
- Strict access controls enforced

