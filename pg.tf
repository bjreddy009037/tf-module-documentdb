resource "aws_elasticache_parameter_group" "main" {
  name   = "${var.COMPONENT}-${var.ENV}-cache"
  family = var.FAMILY
}