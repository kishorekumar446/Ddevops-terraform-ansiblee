terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "ap-south-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-06b72b3b2a773be2b"
  instance_type = "t2.micro"
  key_name = "kk-import-ansible"

  tags = {
    Name = "kk-DevOps-batch-server"
    env = "Production"
    owner = "kk-jt-ansbile"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

