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



resource "aws_key_pair" "tssr" {
   key_name   = "tssr"
   public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCgU/lffXY0aBZuQu11vV/GXUqHE1sk26Pc7AxIUTApYxqf+ajFExjtz0yz5pMWcg7ij4kHSX18gjz7YK6udcngB+Rg1uXP0nKfij6cGXabnFJyOEGnQL//Of7RhPrHu00s2Vq2xYufwljN0Q6MxWn3JPHPkjnscSqiQ3dQZvN/pFNSN+b73n4jMTVIlcjLJ+OVd1ZUbrjVc9e62/gxr98mM0ndyVGaVWrjtWAk8O3OsZ7Wk4NvoiEryrOc+NoWGdHOmvLR5fNgIXTFW1kbpJAdZYZ57AN9P/ZsheX0DZMaW1GdKRNcq4VRXAaxOD0WdLfk82RIh7xDAvKBzOOBseDNOlNNIhsL8jeC/CbQd9nrye2vdChbRU8csl8LnHzcZZlD9gl23m46N9+p0F62cRQzHo1w4ieJkbpQKgB43WXnU1OYZRRf9IA43PmcmE5nFmLPbw6oW86kcU37iOlgNdHG/7ayoP+08ZPEj1lszjq4D48zPINqqjQKE0DWkBfRQgcJa4mLeIZqZoNp6uMKeVPcfglzNI09s8GQlFzNbMdmo6CUFvBA5XgOEGp6zC+ZoKK8jmLNTPukI0eWbKis6IXUAeiEIgcXbrwY1Y9GB8hExfuNbUuLIZ5cs/ajQ/bxjG8XgOsRf5PT/Bz1yXKishBNdIxM8pJI0VxCl3OVCZZgGw== tssr@tssr-ubuntu"
 }


resource "aws_instance" "tssr-terraform-01" {
  ami           = "ami-02f3416038bdb17fb"
  instance_type = "t2.micro"
  vpc_security_group_ids	= [aws_security_group.tssr_allow_ssh_http.id]
  key_name	= "tssr"

  root_block_device {
    volume_size = 10
  }

  tags = {
    Name = var.instance_name
  }
}

