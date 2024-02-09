terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "us-east-2"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-011ab7c70f5b5170a"
  instance_type = "t2.micro"
  key_name = "kk-import-ansible"

  tags = {
    Name = "Raman-DevOps-batch-server"
    env = "Production"
    owner = "Raman Khanna"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /tmp/inv"
  }
}

