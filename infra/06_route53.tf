resource "aws_route53_record" "bi" {
  zone_id = var.zone_id
  name    = var.subdomain
  type    = "A"
  ttl     = 300
  records = [
    aws_instance.this.public_ip
  ]
}