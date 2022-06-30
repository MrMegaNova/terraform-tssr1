output "instance_wp_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.tssr-terraform-wordpress.*.id
}

output "instance_wp_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.tssr-terraform-wordpress.*.public_ip
}

output "instance_mysql_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.tssr-terraform-mysql.*.id
}

output "instance_ysql_public_ip" {
  description = "Public IP address of the EC2 instance"
  value       = aws_instance.tssr-terraform-mysql.*.public_ip
}

