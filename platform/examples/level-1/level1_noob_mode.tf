# Create an EC2 instance
# Documentation: https://www.terraform.io/docs/providers/aws/r/instance.html
# ----------------------------------------------------------------------------------------------------------------------

provider "aws" {
  region     = "eu-central-"
  access_key = "access-key"
  secret_key = "secret"
}


resource "aws_instance" "instance1" {
  ami           = "ami-2757f631"
  instance_type = "t2.micro"

  tags = {
    Name = "This is my instance"
  }
}