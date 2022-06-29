terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-2"
}


resource "aws_instance" "tssr-terraform" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids	= [aws_security_group.tssr_allow_ssh_http.id]
  key_name	= "tssr"
  count = var.instance_count

  root_block_device {
    volume_size = var.volume_size
  }

  tags = {
    Name = "tssr-terraform-${count.index+1}"
  }
}

