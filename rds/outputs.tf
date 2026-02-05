output "rds_endpoint" {
  description = "RDS Endpoint"
  value       = aws_db_instance.database_instance.endpoint
}