resource "aws_iam_user" "create_user" {
  name  = var.condition == true ? var.usrsList[count.index] : "default-user"
  count = 5
}

resource "aws_security_group" "security_group" {
  tags = {
    "terer" = "fadfasd"
  }
  dynamic "ingress" {
    for_each = var.port
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_instance" "terraform_instance" {
  ami           = lookup(var.ami, "us-east-1")
  instance_type = "t2.micro"
  tags = {
    Name = element(var.tags, count.index)
  }
  count = 2
  }
