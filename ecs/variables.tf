variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "project_name" {
  description = "The AWS project name for tagging and identification"
  type        = string
}

variable "environment" {
  description = "The AWS environment (e.g., dev, staging, prod)"
  type        = string
}

variable "task_cpu" {
  description = "The CPU units to allocate to the ECS task"
  type        = number
}

variable "task_memory" {
  description = "The memory (in MiB) to allocate to the ECS task"
  type        = number
}

variable "ecs_task_execution_role_arn" {
  description = "The ARN of the ECS task execution role"
  type        = string
}

variable "ecs_task_role_arn" {
  description = "The ARN of the ECS task role"
  type        = string
}

variable "architecture" {
  description = "The CPU architecture for the ECS task"
  type        = string
}

variable "container_image" {
  description = "The container image to use for the ECS task"
  type        = string
}

variable "container_port" {
  description = "The port to expose on the container"
  type        = number
}

variable "host_port" {
  description = "The port to expose on the host"
  type        = number
}

variable "service_desired_count" {
  description = "The desired count of ECS tasks for the service"
  type        = number
}

variable "private_app_subnet_az1_id" {
  description = "The ID of the private application subnet in AZ1"
  type        = string
}

variable "private_app_subnet_az2_id" {
  description = "The ID of the private application subnet in AZ2"
  type        = string
}

variable "app_security_group_id" {
  description = "The ID of the application security group"
  type        = string
}

variable "alb_target_group_arn" {
  description = "The ARN of the target group"
  type = string
}

