resource "aws_docdb_cluster" "main" {
  cluster_identifier      = "${var.COMPONENT}-${var.ENV}"
  engine                  = var.ENGINE
  engine_version          = var.ENGINE_VERSION
  master_username         = jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["DOCDB_USERNAME"]
  master_password         = jsondecode(data.aws_secretsmanager_secret_version.secret-version.secret_string)["DOCDB_PASSWORD"]
  skip_final_snapshot     = var.SKIP_FINAL_SNAPSHOT
  db_subnet_group_name    = aws_docdb_subnet_group.main.name
  db_cluster_parameter_group_name = aws_docdb_cluster_parameter_group.main.name
}


resource "aws_docdb_cluster_instance" "docdb_instance" {
  count              = var.NODE_COUNT
  identifier         = "docdb-cluster-demo-${count.index}"
  cluster_identifier = aws_docdb_cluster.main.id
  instance_class     = var.NODE_TYPE
}