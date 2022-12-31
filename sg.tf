resource "aws_security_group" "sgfordocdb" {
  name        = "allow_documentdb-${var.COMPONENT}-${var.ENV}"
  description = "allow_documentdb-${var.COMPONENT}-${var.ENV}"
  vpc_id      = varVPC_ID

  ingress {
    description = "MONGODB"
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = [var.VPC_CIDR]

  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow_documentdb-${var.COMPONENT}-${var.ENV}"
  }
}