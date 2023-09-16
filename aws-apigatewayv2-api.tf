resource "aws_apigatewayv2_api" "proxy" {
  name          = var.fqdn
  protocol_type = "HTTP"
}
