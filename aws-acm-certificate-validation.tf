resource "aws_acm_certificate_validation" "proxy" {
  provider = aws.acm_issuer

  certificate_arn         = aws_acm_certificate.proxy.arn
  validation_record_fqdns = [for record in cloudflare_record.proxy : record.hostname]
}
