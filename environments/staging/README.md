# Staging Environment

This directory contains Terraform configuration for the staging environment.

## Usage

**Important**: Run Terraform commands from the **root directory** of the repository, not from this directory.

### First Time Setup

1. Navigate to the root directory:
   ```bash
   cd ../../
   ```

2. Create and select the staging workspace:
   ```bash
   terraform workspace new staging
   terraform workspace select staging
   ```

3. Initialize Terraform (if not already done):
   ```bash
   terraform init
   ```

### Regular Workflow

1. Ensure you're in the root directory and select the staging workspace:
   ```bash
   terraform workspace select staging
   ```

2. Review the plan:
   ```bash
   terraform plan -var-file=environments/staging/terraform.tfvars
   ```

3. Apply changes:
   ```bash
   terraform apply -var-file=environments/staging/terraform.tfvars
   ```

### Useful Commands

- Check current workspace: `terraform workspace show`
- List all workspaces: `terraform workspace list`
- Switch to staging workspace: `terraform workspace select staging`
- Destroy resources: `terraform destroy -var-file=environments/staging/terraform.tfvars`

## Variables

See `terraform.tfvars` in this directory for environment-specific variable values.

## Prerequisites

- Terraform >= 1.5.0
- AWS CLI configured with appropriate credentials
- Access to AWS staging account

