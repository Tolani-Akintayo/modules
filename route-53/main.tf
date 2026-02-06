data "aws_route53_zone" "hosted_zone" {
  name = var.domain_name
}

resource "aws_route53_record" "site_domain" {
  zone_id = data.aws_route53_zone.hosted_zone.zone_id
  name    = var.record_name # e.g. "www" or "app"
  type    = "A"
  ttl     = 300

 alias {
   name = var.application_load_balancer_dns_name
   zone_id = var.application_load_balancer_zone_id
   evaluate_target_health = true
 }
}