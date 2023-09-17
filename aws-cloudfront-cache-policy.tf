data "aws_cloudfront_cache_policy" "proxy" {
  name = var.cache_policy_name
}
