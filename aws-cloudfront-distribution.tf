resource "aws_cloudfront_distribution" "proxy" {
  enabled = true

  aliases = [var.fqdn]

  origin {
    origin_id   = aws_apigatewayv2_api.proxy.id
    origin_path = "/${aws_apigatewayv2_stage.proxy.name}"
    domain_name = replace(aws_apigatewayv2_api.proxy.api_endpoint, "https://", "")
    custom_origin_config {
      http_port              = "80"
      https_port             = "443"
      origin_protocol_policy = "https-only"
      origin_ssl_protocols   = ["TLSv1.2"]
    }
  }

  default_cache_behavior {
    allowed_methods  = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = aws_apigatewayv2_api.proxy.id

    cache_policy_id = aws_cloudfront_cache_policy.proxy.id

    viewer_protocol_policy = "redirect-to-https"
  }

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn            = aws_acm_certificate.proxy.arn
    ssl_support_method             = "sni-only"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  depends_on = [
    aws_acm_certificate.proxy,
    aws_acm_certificate_validation.proxy
  ]

}

