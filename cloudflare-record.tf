resource "cloudflare_record" "proxy" {
  for_each = {
    for dvo in aws_acm_certificate.proxy.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  zone_id = var.zone_id
  name    = each.value.name
  value   = each.value.record
  type    = each.value.type
  ttl     = 3600
  proxied = false

  depends_on = [aws_acm_certificate.proxy]
}
