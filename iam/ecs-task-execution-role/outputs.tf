output "ecs_task_execution_role" {
  description = "ECS Task execution role"
  value = aws_iam_role.ecs_task_execution_role.arn
}

output "ecs_task_role" {
  description = "ECS Task role"
  value = aws_iam_role.ecs_task_role.arn
}