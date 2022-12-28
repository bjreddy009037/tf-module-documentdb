data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraformforme"
    key    = "vpc/${var.ENV}/${var.COMPONENT}/terraform.tfstate"
    region = "us-east-1"
  }
}

data "aws_secretsmanager_secret" "secret" {
  name = "secret-for-roboshop"
}


data "aws_secretsmanager_secret_version" "secret-version" {
  secret_id     = data.aws_secretsmanager_secret.secret.id

}
