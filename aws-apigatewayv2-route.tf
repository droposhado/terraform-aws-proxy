resource "aws_apigatewayv2_route" "proxy" {
  api_id    = aws_apigatewayv2_api.proxy.id
  route_key = "ANY /{proxy+}"

  target = "integrations/${aws_apigatewayv2_integration.proxy.id}"
}
