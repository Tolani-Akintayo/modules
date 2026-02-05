output "domain_name" {
  description = "Domain name"
  value       = var.domain_name
}

output "acm_certificate_arn" {
  description = "Certificate ARN"
  value       = aws_acm_certificate.acm_certificate.arn
}