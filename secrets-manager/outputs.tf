output "rds_db_secret_name" {
  description = "RDS database name"
  value       = local.secrets.db_name
}

output "rds_db_username" {
  description = "RDS database username"
  value       = local.secrets.username
}

output "rds_db_password" {
  description = "RDS database password"
  value       = local.secrets.password
}