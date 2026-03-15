variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "alb_security_group_id" {
  description = "ALB Security group id"
  type        = string
}

variable "public_subnet_az1_id" {
  description = "Public Subnet AZ1"
  type        = string
}

variable "public_subnet_az2_id" {
  description = "Public Subnet AZ2"
  type        = string
}

variable "target_type" {
  description = "Target type for the ALB"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the ALB will be deployed"
  type        = string
}

variable "health_check_path" {
  description = "The Health Check path fot the ALB"
  type        = string
}

variable "acm_certificate_arn" {
  description = "ACM Certificate ARN for the ALB HTTPS listener"
  type        = string
}