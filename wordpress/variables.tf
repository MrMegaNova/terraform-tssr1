variable "instance_type" {
  description = "Value of the instance type for the EC2 instance"
  type        = string
  default     = "t2.micro"
}


variable "ami" {
  description = "Value of the AMI for the EC2 instance"
  type        = string
  default     = "ami-02f3416038bdb17fb"
}


variable "volume_size" {
  description = "Value of the root storage volume size for the EC2 instance"
  type        = string
  default     = "10"
}

variable "instance_count" {
  description = "Value of the root storage volume size for the EC2 instance"
  type        = number
  default     = 1
}

variable "aws_key" {
  description = "Value of the SSH-key pair for the EC2 instance"
  type        = string
  default     = "tssr"
}
