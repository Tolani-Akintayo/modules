# Database subnet group for RDS
resource "aws_db_subnet_group" "db_subnet_group" {
  name = "${var.environment}-${var.project_name}-db-subnet-group"
  subnet_ids = [
    var.private_data_subnet_az1_id,
    var.private_data_subnet_az2_id,
  ]
  description = "Subnet group for ${var.project_name} RDS instance in ${var.environment} environment"

  tags = {
    Name = "${var.project_name}-${var.environment}-db-subnet-group"
  }
}

# RDS instance
resource "aws_db_instance" "database_instance" {
  engine                 = var.database_engine
  engine_version         = var.database_engine_version
  multi_az               = var.multi_az_deployment
  identifier             = var.database_instance_identifier
  username               = var.rds_db_username
  password               = var.rds_db_password
  db_name                = var.rds_db_secret_name
  instance_class         = var.database_instance_class
  allocated_storage      = 200
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [var.database_security_group_id]
  availability_zone      = var.availability_zone_1
  skip_final_snapshot    = true
  publicly_accessible    = var.publicly_accessible
}
