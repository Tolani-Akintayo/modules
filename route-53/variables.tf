variable "domain_name" {
  description = "The domain name for the Route 53 hosted zone (e.g. example.com)."
  type        = string
}

variable "record_name" {
  description = "The record name for the Route 53 record (e.g. www or app)."
  type        = string
}

variable "application_load_balancer_dns_name" {
  description = "The DNS name of the Application Load Balancer to which the Route 53 record will point."
  type        = string
}

variable "application_load_balancer_zone_id" {
  description = "The hosted zone ID of the Application Load Balancer to which the Route 53 record will point."
  type        = string
}