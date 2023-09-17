variable "acm_certificate_arn" {
  type        = string
  description = "Cloudfront distribution needs a certificate generated or imported on us-east-1"
}

variable "cache_policy_name" {
  type        = string
  default     = "Managed-CachingDisabled"
  description = "Name of policy applied on cache. Default is CachingDisabled, recommended to use with ApiGateway"
}

variable "fqdn" {
  type        = string
  description = "Custom full domain (include subdomain) as CNAME to Cloudfront"
}

variable "origin_policy_name" {
  type        = string
  default     = "Managed-AllViewerExceptHostHeader"
  description = "Name of policy applied on origin. Default is AllViewerExceptHostHeader, recommended to use with ApiGateway"
}

variable "proxy_url" {
  type        = string
  description = "Destination behind ApiGateway where application lives"
}

variable "stage" {
  type        = string
  description = "Used to identify stage in ApiGateway"
}
