# VPC Module

This module creates a VPC with public and private subnets, Internet Gateway, NAT Gateway, route tables, and VPC Flow Logs following AWS best practices.

## Features

- VPC with configurable CIDR block
- Public subnets (one per availability zone) with Internet Gateway route
- Private subnets (one per availability zone) with NAT Gateway route
- Single shared NAT Gateway (cost-effective)
- VPC Flow Logs to CloudWatch Logs
- Proper resource tagging
- Multi-AZ deployment support

## Usage

```hcl
module "vpc" {
  source = "../../modules/vpc"

  environment  = var.environment
  project_name = var.project_name
  vpc_cidr     = "12.0.0.0/16"
  
  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| environment | Environment name (dev, staging, prod) | `string` | n/a | yes |
| project_name | Name of the project | `string` | n/a | yes |
| vpc_cidr | CIDR block for the VPC | `string` | `"12.0.0.0/16"` | no |
| availability_zones | Number of availability zones to use | `number` | `2` | no |
| enable_nat_gateway | Enable NAT Gateway for private subnets | `number` | `1` | no |
| enable_vpc_flow_logs | Enable VPC Flow Logs | `bool` | `true` | no |
| flow_log_destination_type | Type of flow log destination (cloud-watch-logs, s3) | `string` | `"cloud-watch-logs"` | no |
| flow_log_cloudwatch_log_group_name | CloudWatch Log Group name for VPC Flow Logs | `string` | `"/aws/vpc/flow-logs"` | no |
| tags | A map of tags to assign to resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| vpc_id | ID of the VPC |
| vpc_cidr_block | CIDR block of the VPC |
| internet_gateway_id | ID of the Internet Gateway |
| public_subnet_ids | List of public subnet IDs |
| private_subnet_ids | List of private subnet IDs |
| public_subnet_cidrs | List of public subnet CIDR blocks |
| private_subnet_cidrs | List of private subnet CIDR blocks |
| nat_gateway_id | ID of the NAT Gateway |
| nat_gateway_public_ip | Public IP address of the NAT Gateway |
| public_route_table_id | ID of the public route table |
| private_route_table_id | ID of the private route table |
| availability_zones | List of availability zones used |
| vpc_flow_log_id | ID of the VPC Flow Log |

## Subnet CIDR Calculation

- Public subnets: `/24` blocks starting from the VPC CIDR (e.g., `12.0.0.0/24`, `12.0.1.0/24`)
- Private subnets: `/24` blocks offset by the number of AZs (e.g., `12.0.2.0/24`, `12.0.3.0/24` for 2 AZs)

## Resources Created

- 1 VPC
- 1 Internet Gateway
- 1 Elastic IP (for NAT Gateway)
- 1 NAT Gateway (shared)
- N Public Subnets (where N = number of AZs)
- N Private Subnets (where N = number of AZs)
- 1 Public Route Table
- 1 Private Route Table
- N Public Route Table Associations
- N Private Route Table Associations
- 1 CloudWatch Log Group (for VPC Flow Logs)
- 1 IAM Role (for VPC Flow Logs)
- 1 IAM Role Policy (for VPC Flow Logs)
- 1 VPC Flow Log

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.0 |
| aws | ~> 5.0 |

