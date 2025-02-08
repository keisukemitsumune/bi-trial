resource "aws_acm_certificate" "this" {
  domain_name       = var.subdomain
  validation_method = "DNS"
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_route53_record" "cert" {
  for_each = {
    for d in aws_acm_certificate.this.domain_validation_options : d.domain_name => {
      name   = d.resource_record_name
      type   = d.resource_record_type
      record = d.resource_record_value
    }
  }
  zone_id = var.zone_id
  name    = each.value.name
  type    = each.value.type
  records = [each.value.record]
  ttl     = 60
}

resource "aws_acm_certificate_validation" "this" {
  certificate_arn = aws_acm_certificate.this.arn
  validation_record_fqdns = [
    for r in aws_route53_record.cert : r.fqdn
  ]
}

resource "aws_route53_record" "bi" {
  zone_id = var.zone_id
  name    = var.subdomain
  type    = "A"
  alias {
    name                   = aws_lb.this.dns_name
    zone_id                = aws_lb.this.zone_id
    evaluate_target_health = true
  }
}

resource "aws_route53_record" "static" {
  zone_id = var.zone_id
  name    = var.static-subdomain
  type    = "CNAME"
  ttl     = 60
  records = [
    var.static-cname
  ]
}