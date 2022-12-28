data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "terraformforme"
    key    = "vpc/${var.ENV}/${var.COMPONENT}/terraform.tfstate"
    region = "us-east-1"
  }
}


