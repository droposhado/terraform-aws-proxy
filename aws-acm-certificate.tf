resource "aws_acm_certificate" "proxy" {
  provider          = aws.acm_issuer
  domain_name       = var.fqdn
  validation_method = "DNS"

  lifecycle {
    create_before_destroy = true
  }
}
