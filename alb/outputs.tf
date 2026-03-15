output "alb_target_group_arn" {
  description = "The ARN of the Application Load Balancer target group"
  value = aws_lb_target_group.app_target_group.arn
}

output "application_load_balancer_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value = aws_lb.application_load_balancer.dns_name
}

output "application_load_balancer_zone_id" {
  description = "The zone ID of the Application Load Balancer"
  value = aws_lb.application_load_balancer.zone_id
}