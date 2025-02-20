module "ec2Stage" {
  source            = "../../../module/ec2"
  aws_instance_type = "t2.micro"
  aws_ami           = "ami-0e443b903466f6804"
}
