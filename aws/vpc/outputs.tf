output "vpc_id" {
  value = aws_vpc.main.id
}

output "cidr_block" {
  value = aws_vpc.main.cidr_block
}

output "public_subnet" {
  value = aws_subnet.public[*].id
}

output "private_subnet" {
  value = aws_subnet.private[*].id
}

output "availability_zone" {
  value = data.aws_availability_zones.available.names
}

output "eip_id" {
  value = aws_eip.nat[*].id
}