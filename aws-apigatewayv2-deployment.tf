resource "aws_apigatewayv2_deployment" "proxy" {
  api_id = aws_apigatewayv2_api.proxy.id

  triggers = {
    redeployment = sha1(join(",", tolist([
      jsonencode(aws_apigatewayv2_integration.proxy),
      jsonencode(aws_apigatewayv2_route.proxy),
    ])))
  }

  lifecycle {
    create_before_destroy = true
  }
}
