variable "vpc_id" {
  description = "ID of the VPC where the security group will be created"
  type        = string
}

variable "environment" {
  description = "Environment name (dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "tags" {
  description = "A map of tags to assign to the security group"
  type        = map(string)
  default     = {}
}

