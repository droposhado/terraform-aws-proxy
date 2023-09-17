data "aws_cloudfront_origin_request_policy" "proxy" {
  name = var.origin_policy_name
}
