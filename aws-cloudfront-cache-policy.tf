resource "aws_cloudfront_cache_policy" "proxy" {
  name = "proxy-with-headers"

  default_ttl = 3600
  min_ttl     = 1
  max_ttl     = 86400

  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "all"
    }
    headers_config {
      header_behavior = "whitelist"
      headers = {
        items = [
          "Origin",
          "Host",
          "Authorization",
          "Accept-Language"
        ]
      }
    }
    query_strings_config {
      query_string_behavior = "all"
    }
  }
}
