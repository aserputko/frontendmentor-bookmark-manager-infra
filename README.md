# Roadmap Bookmark Manager Infrastructure

Infrastructure as Code (IaC) repository for the Roadmap Bookmark Manager application using Terraform and AWS.

## Repository Structure

```
.
├── environments/          # Environment-specific configurations
│   ├── dev/              # Development environment
│   ├── staging/          # Staging environment
│   └── prod/             # Production environment
├── modules/              # Reusable Terraform modules
├── main.tf               # Main Terraform configuration
├── variables.tf          # Variable definitions
├── outputs.tf           # Output definitions
├── providers.tf         # Provider configuration
└── versions.tf          # Terraform and provider version constraints
```

## Prerequisites

- Terraform >= 1.5.0
- AWS CLI configured with appropriate credentials
- Access to AWS account(s)

## Getting Started

1. **Choose an environment**: Navigate to the desired environment directory (`environments/dev`, `environments/staging`, or `environments/prod`)

2. **Initialize Terraform**:
   ```bash
   cd environments/dev
   terraform init
   ```

3. **Review the plan**:
   ```bash
   terraform plan
   ```

4. **Apply changes** (after review):
   ```bash
   terraform apply
   ```

## Configuration

### Environment Variables

Each environment has its own `terraform.tfvars` file with environment-specific values:
- `environment`: Environment name (dev, staging, prod)
- `aws_region`: AWS region for resources
- `project_name`: Project identifier
- `owner`: Owner/team responsible for infrastructure
- `cost_center`: Cost center for billing allocation

### Default Tags

All resources are automatically tagged with:
- `Environment`: The environment name
- `Project`: Project name
- `ManagedBy`: Terraform
- `Owner`: Owner/team
- `CostCenter`: Cost center

## Development Workflow

1. Make changes to Terraform files
2. Run `terraform fmt` to format code
3. Run `terraform validate` to check syntax
4. Run `terraform plan` to preview changes
5. Create a pull request with plan output
6. After approval, apply changes

## Security

- Never commit secrets or credentials to version control
- Use AWS Secrets Manager or SOPS for sensitive data
- All `*.tfvars` files are excluded from git (see `.gitignore`)
- Use IAM roles with least privilege principle

## Tools

This repository uses the following tools:
- **Terraform**: Infrastructure provisioning
- **tflint**: Terraform linting
- **tfsec**: Security scanning
- **terraform-docs**: Documentation generation

## Contributing

1. Create a feature branch from `main`
2. Make your changes following Terraform best practices
3. Run validation and security scans
4. Submit a pull request with plan output
5. Ensure all checks pass before merging

## Documentation

- Each module should have a `README.md` with usage examples
- Each environment directory contains environment-specific documentation
- Architecture diagrams should be added for complex infrastructure

## Support

For questions or issues, please create an issue in the repository or contact the DevOps team.

