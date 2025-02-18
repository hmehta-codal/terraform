resource "aws_security_group" "example_sg" {
  name        = "example-security-group"
  description = "Allow SSH and HTTP"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "example" {
  ami           = "ami-0a887e401f7654935"
  instance_type = "t2.micro"
  tags = {
    Name = "HelloWorld"
  }
  key_name = "terraform"  


  vpc_security_group_ids = [aws_security_group.example_sg.id]


  connection {
    type        = "ssh"
    user        = "ec2-user"
    private_key = file("~/.ssh/terraform.pem") 
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum install -y httpd",
      "sudo systemctl start httpd"
    ]
  }
  depends_on = [aws_security_group.example_sg]

  provisioner "remote-exec" {
  when = "destroy"
    inline = [ 
        "sudo yum remove -y httpd"
     ]
}
}

resource "null_resource" "user_create" {    
    provisioner "local-exec" {
    command = "sudo useradd ${var.usersList[count.index]} echo ${var.usersList[count.index]}"
  }
  count = length(var.usersList)

}


