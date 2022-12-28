resource "aws_docdb_cluster" "docdb" {
  cluster_identifier      = "my-docdb-cluster"
  engine                  = var.ENGINE
  master_username         = "foo"
  master_password         = "mustbeeightchars"
  skip_final_snapshot     = var.SKIP_FINAL_POINT
  db_subnet_group_name    = aws_docdb_subnet_group.main.name
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.main.name
}
