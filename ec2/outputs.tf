output "public_ip" {
  description = "The public IP address assigned to the instance"
  value       = aws_instance.main.public_ip
}

output "private_ip" {
  description = "The private IP address assigned to the instance."
  value       = aws_instance.main.private_ip
}

output "id" {
  description = "The ID of the instance"
  value       = aws_instance.main.id
}

output "pni_id" {
  value = aws_instance.main.primary_network_interface_id
}
