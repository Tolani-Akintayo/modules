variable "project_name" {
  description = "The AWS project name for tagging and identification"
  type        = string
}

variable "environment" {
  description = "The AWS environment (e.g., dev, staging, prod)"
  type        = string
}