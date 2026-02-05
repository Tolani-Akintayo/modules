# Application load Balancer
resource "aws_lb" "application_load_balancer" {
  name                       = "${var.environment}-${var.project_name}-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [var.alb_security_group_id]
  subnets                    = [var.public_subnet_az1_id, var.public_subnet_az2_id]
  enable_deletion_protection = true

  tags = {
    Name = "${var.environment}-${var.project_name}-alb"
  }
}

# Target group for ALB
resource "aws_lb_target_group" "app_target_group" {
  name        = "${var.environment}-${var.project_name}-tg"
  target_type = var.target_type
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id

  health_check {
    path                = var.health_check_path
    port                = "traffic-port"
    protocol            = "HTTP"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 5
    unhealthy_threshold = 2
    matcher             = "200, 301, 302" #"200-399"
  }

  tags = {
    Name = "${var.environment}-${var.project_name}-tg"
  }
}

# HTTP listener - redirects to HTTPS
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# HTTPS Listener - Forwards to target group
resource "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.acm_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_target_group.arn
  }
}