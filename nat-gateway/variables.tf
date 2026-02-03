# Variables for the nat gateway
variable "environment" {
  description = "Environment (dev, staging, prod)"
  type = string
}

variable "project_name" {
  description = "Project name" 
  type = string
}

variable "public_subnet_az2_id" {
  description = "The ID of public subnet in AZ2"
  type = string
}

variable "internet_gateway" {
  description = "The Internet Gateway"
  type = string
}

variable "vpc_id" {
  description = "The ID of the VPC"
  type = string
}

variable "private_app_subnet_az1_id" {
  description = "The ID of private app subnet in AZ1"
  type = string
}

variable "private_app_subnet_az2_id" {
  description = "The ID of private app subnet in AZ2"
  type = string
}

variable "private_data_subnet_az1_id" {
  description = "The ID of private data subnet in AZ1"
  type = string
}

variable "private_data_subnet_az2_id" {
  description = "The ID of private data subnet in AZ2"
  type = string
}
