# Production Environment

This directory contains Terraform configuration for the production environment.

## Usage

**Important**: Run Terraform commands from the **root directory** of the repository, not from this directory.

### First Time Setup

1. Navigate to the root directory:
   ```bash
   cd ../../
   ```

2. Create and select the prod workspace:
   ```bash
   terraform workspace new prod
   terraform workspace select prod
   ```

3. Initialize Terraform (if not already done):
   ```bash
   terraform init
   ```

### Regular Workflow

1. Ensure you're in the root directory and select the prod workspace:
   ```bash
   terraform workspace select prod
   ```

2. Review the plan:
   ```bash
   terraform plan -var-file=environments/prod/terraform.tfvars
   ```

3. Apply changes (requires manual approval):
   ```bash
   terraform apply -var-file=environments/prod/terraform.tfvars
   ```

### Useful Commands

- Check current workspace: `terraform workspace show`
- List all workspaces: `terraform workspace list`
- Switch to prod workspace: `terraform workspace select prod`
- Destroy resources: `terraform destroy -var-file=environments/prod/terraform.tfvars`

## Variables

See `terraform.tfvars` in this directory for environment-specific variable values.

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
- Always review `terraform plan` output carefully before applying

