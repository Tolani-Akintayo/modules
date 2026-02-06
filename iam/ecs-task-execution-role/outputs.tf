output "ecs_task_execution_role_arn" {
  description = "ECS Task execution role ARN"
  value = aws_iam_role.ecs_task_execution_role.arn
}

output "ecs_task_role_arn" {
  description = "ECS Task role ARN"
  value = aws_iam_role.ecs_task_role.arn
}