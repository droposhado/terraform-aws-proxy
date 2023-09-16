terraform {
  required_providers {
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "4.5.0"
    }
  }
}

provider "aws" {
  # Cloudfront distribution needs a certificate generated or imported
  # on us-east-1
  # https://docs.aws.amazon.com/acm/latest/userguide/acm-regions.html

  alias  = "acm_issuer"
  region = "us-east-1"
}
