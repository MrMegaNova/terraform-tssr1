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



resource "aws_instance" "tssr-terraform-mysql" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids	= [aws_security_group.tssr_allow_ssh_sql.id]
  key_name	= "tssr"
  count = var.instance_count

  provisioner "file" {
    source      = "scripts/mysql.sh"
    destination = "/tmp/mysql.sh"
  }


  root_block_device {
    volume_size = var.volume_size
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa.d")}"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/mysql.sh",
      "/tmp/mysql.sh",
      "reboot",
    ]
  }

  tags = {
    Name = "tssr-terraform-mysql-${count.index+1}"
  }
}

resource "aws_instance" "tssr-terraform-wordpress" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids        = [aws_security_group.tssr_allow_ssh_http.id]
  key_name      = "tssr"
  count = var.instance_count
  
  provisioner "file" {
    source      = "scripts/wordpress.sh"
    destination = "/tmp/wordpress.sh"
  }
  

  root_block_device {
    volume_size = var.volume_size
  }

  connection {
    type     = "ssh"
    user     = "ubuntu"
    private_key = "${file("~/.ssh/id_rsa.d")}"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/wordpress.sh",
      "/tmp/wordpress.sh",
      "reboot",
    ]
  }

  tags = {
    Name = "tssr-terraform-wordpress${count.index+1}"
  }
}
