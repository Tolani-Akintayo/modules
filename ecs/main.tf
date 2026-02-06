# ECS Cluster 
resource "aws_ecs_cluster" "ecs_cluster" {
  name = "${var.environment}-${var.project_name}-cluster"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Name = "${var.environment}-${var.project_name}-cluster"
  }
}

# CloudWatch Log Group
resource "aws_cloudwatch_log_group" "log_group" {
  name              = "/ecs/${var.environment}-${var.project_name}-td"
  retention_in_days = 7

  lifecycle {
    create_before_destroy = true
  }

  tags = {
    Name = "${var.environment}-${var.project_name}-log-group"
  }
}

# ECS Task Definition
resource "aws_ecs_task_definition" "ecs_task_definition" {
  family                   = "${var.environment}-${var.project_name}-td"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = var.task_cpu
  memory                   = var.task_memory
  execution_role_arn       = var.ecs_task_execution_role_arn
  task_role_arn            = var.ecs_task_role_arn

  runtime_platform {
    operating_system_family = "LINUX"
    cpu_architecture = var.architecture
  }

  container_definitions = jsonencode([
    {
      name      = "${var.environment}-${var.project_name}-container"
      image     = var.container_image
      essential = true

      portMappings = [
        {
          containerPort = var.container_port
          hostPort      = var.host_port
          protocol      = "tcp"
        }
      ]
      logConfiguration = {
        logDriver = "awslogs"
        options = {
          "awslogs-group"         = aws_cloudwatch_log_group.log_group.name
          "awslogs-region"        = var.region
          "awslogs-stream-prefix" = "${var.environment}-${var.project_name}"
        }
      }
    }
  ])

  tags = {
    Name = "${var.environment}-${var.project_name}-td"
  }
  
}

# ECS Service
resource "aws_ecs_service" "ecs_service"{
  name            = "${var.environment}-${var.project_name}-service"
  cluster         = aws_ecs_cluster.ecs_cluster.id
  task_definition = aws_ecs_task_definition.ecs_task_definition.arn
  desired_count   = var.service_desired_count
  launch_type     = "FARGATE"
  platform_version = "LATEST"
  deployment_minimum_healthy_percent = 100
  deployment_maximum_percent = 200
  enable_ecs_managed_tags = true
  propagate_tags = "SERVICE"

  # wait for service to reach steady state before marking complete
  wait_for_steady_state = true

  # Fail fast if tasks keep crashing
  deployment_circuit_breaker {
    enable = true
    rollback = true
  }

  # Don't wait forever
  timeouts {
    create = "10m"
    update = "10m"
  }

  network_configuration {
    subnets         = [var.private_app_subnet_az1_id, var.private_app_subnet_az2_id]
    security_groups = [var.app_security_group_id]
    assign_public_ip = false
  }

   load_balancer {
     target_group_arn = var.alb_target_group_arn
     container_name = "${var.environment}-${var.project_name}-container"
     container_port = 80
   }

  tags = {
    Name = "${var.environment}-${var.project_name}-service"
  }
}