resource "aws_apigatewayv2_stage" "proxy" {
  name        = var.stage
  api_id      = aws_apigatewayv2_api.proxy.id
  auto_deploy = true
}
