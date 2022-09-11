output "public_ip" {
  description = "The public IP address assigned to the instance"
  value       = aws_instance.main.public_ip
}

output "private_ip" {
  description = "The private IP address assigned to the instance."
  value       = aws_instance.main.private_ip
}