resource "aws_apigatewayv2_integration" "proxy" {
  api_id           = aws_apigatewayv2_api.proxy.id
  integration_type = "HTTP_PROXY"

  integration_method = "ANY"
  integration_uri    = "${var.proxy_url}/{proxy}"
}
