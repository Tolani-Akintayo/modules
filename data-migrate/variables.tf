variable "environment" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "project_name" {
  description = "Project name"
  type        = string
}

variable "amazon_linux_ami_id" {
  description = "The ami id for data migrate server"
  type = string
}

variable "ec2_instance_type" {
  description = "The ec2 instance type for data migrate server"
  type = string
}

variable "private_app_subnet_az1_id" {
  description = "The private subnet for the data migrate server"
  type = string
}

variable "data_migration_server_security_group_id" {
  description = "security group for the database migration server"
  type = string
}

variable "ec2_instance_instance_profile_role_name" {
  description = "The instance profile that allows s3 full access on the data migrate server"
  type = string
}

variable "flyway_version" {
  description = "The flyway version to be used by the data migrate server"
  type = string
}

variable "sql_script_s3_uri" {
  description = "sql script to be migrated to the database"
  type = string
}

variable "rds_endpoint" {
  description = "RDS Endpoint to allow data migration"
  type = string
}

variable "rds_db_secret_name" {
  description = "RDS database name"
  type = string
}

variable "rds_db_username" {
  description = "RDS database username"
  type = string
}

variable "rds_db_password" {
  description = "RDS database password"
  type = string
}