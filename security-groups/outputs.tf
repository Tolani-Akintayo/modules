output "eice_security_group_id" {
  description = "security group for the eice"
  value       = aws_security_group.eice_security_group.id
}

output "alb_security_group_id" {
  description = "security group for the load balancer"
  value       = aws_security_group.alb_security_group.id
}

output "app_security_group_id" {
  description = "security group for the application servers"
  value       = aws_security_group.app_security_group.id
}

output "data_migration_server_security_group_id" {
  description = "security group for the database migration server"
  value       = aws_security_group.data_migration_server_security_group.id
}

output "database_security_group_id" {
  description = "security group for the database instance"
  value       = aws_security_group.database_security_group.id
}