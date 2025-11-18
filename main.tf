# Main Terraform configuration
# This file will contain resource definitions as infrastructure is added

# VPC Module
module "vpc" {
  source = "./modules/vpc"

  environment        = var.environment
  project_name       = var.project_name
  vpc_cidr           = var.vpc_cidr
  availability_zones = var.availability_zones

  enable_vpc_flow_logs = var.enable_vpc_flow_logs

  tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
    Owner       = var.owner
    CostCenter  = var.cost_center
  }
}

