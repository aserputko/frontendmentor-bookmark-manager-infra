# Development Environment

This directory contains Terraform configuration for the development environment.

## Usage

**Important**: Run Terraform commands from the **root directory** of the repository, not from this directory.

### First Time Setup

1. Navigate to the root directory:

   ```bash
   cd ../../
   ```

2. Create and select the dev workspace:

   ```bash
   terraform workspace new dev
   terraform workspace select dev
   ```

3. Initialize Terraform (if not already done):
   ```bash
   terraform init
   ```

### Regular Workflow

1. Ensure you're in the root directory and select the dev workspace:

   ```bash
   terraform workspace select dev
   ```

2. Review the plan:

   ```bash
   terraform plan -var-file=environments/dev/terraform.tfvars
   ```

3. Apply changes:
   ```bash
   terraform apply -var-file=environments/dev/terraform.tfvars
   ```

### Useful Commands

- Check current workspace: `terraform workspace show`
- List all workspaces: `terraform workspace list`
- Switch to dev workspace: `terraform workspace select dev`
- Destroy resources: `terraform destroy -var-file=environments/dev/terraform.tfvars`

## Variables

See `terraform.tfvars` in this directory for environment-specific variable values.

## Prerequisites

- Terraform >= 1.5.0
- AWS CLI configured with appropriate credentials
- Access to AWS development account
