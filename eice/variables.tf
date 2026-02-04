variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "private_app_subnet_az1_id" {
  description = "The ID of private app subnet in AZ1"
  type        = string
}

variable "eice_security_group_id" {
  description = "security group for the eice"
  type        = string
}