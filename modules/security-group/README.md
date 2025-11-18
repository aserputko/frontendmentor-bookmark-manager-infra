# Security Group Module

This module creates an AWS security group with predefined ingress and egress rules.

## Purpose

Creates a security group that allows:
- Inbound traffic on ports 22 (SSH), 80 (HTTP), and 443 (HTTPS) from anywhere (`0.0.0.0/0`)
- All outbound traffic

## Usage

```hcl
module "security_group" {
  source = "./modules/security-group"

  vpc_id      = module.vpc.vpc_id
  environment = var.environment
  project_name = var.project_name

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}
```

## Input Variables

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| vpc_id | ID of the VPC where the security group will be created | `string` | n/a | yes |
| environment | Environment name (dev, staging, prod) | `string` | n/a | yes |
| project_name | Name of the project | `string` | n/a | yes |
| tags | A map of tags to assign to the security group | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| security_group_id | ID of the security group |

## Security Rules

### Ingress Rules

- **Port 22 (SSH)**: TCP from `0.0.0.0/0`
- **Port 80 (HTTP)**: TCP from `0.0.0.0/0`
- **Port 443 (HTTPS)**: TCP from `0.0.0.0/0`

### Egress Rules

- **All traffic**: All protocols and ports to `0.0.0.0/0`

## Resource Dependencies

- Requires an existing VPC (passed via `vpc_id` variable)

