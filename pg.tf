resource "aws_docdb_cluster_parameter_group" "main" {
  name   = "${var.COMPONENT}-${var.ENV}-cache"
  family = var.DOCDB_FAMILY
}