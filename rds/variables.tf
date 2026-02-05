# RDS
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "environment" {
  description = "The AWS environment (e.g., dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "The AWS project name for tagging and identification"
  type        = string
}

variable "multi_az_deployment" {
  description = "Enable Multi-AZ deployment for RDS"
  type        = bool
}

variable "database_instance_identifier" {
  description = "The RDS database instance identifier"
  type        = string
}

variable "database_instance_class" {
  description = "RDS instance class (e.g db.t3.micro)"
  type        = string
}

variable "database_engine" {
  description = "Database engine (mysql, postgres, mariadb)"
  type        = string
}

variable "database_engine_version" {
  description = "Database engine version (e.g., 8.039)"
  type        = string
}

variable "publicly_accessible" {
  description = "Makes RDS instance is publicly accessible"
  type        = bool
}

# Variables from main.tf
variable "private_data_subnet_az1_id" {
  description = "The ID of private app subnet in AZ1"
  type        = string
}

variable "private_data_subnet_az2_id" {
  description = "The ID of private app subnet in AZ2"
  type        = string
}

variable "rds_db_username" {
  description = "RDS database username"
  type        = string
}

variable "rds_db_password" {
  description = "RDS database password"
  type        = string
}

variable "rds_db_secret_name" {
  description = "RDS database username"
  type        = string
}

variable "database_security_group_id" {
  description = "security group for the database instance"
  type        = string
}

variable "availability_zone_1" {
  description = "The first availability zone"
  type        = string
}