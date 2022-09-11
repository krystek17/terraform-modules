# Availability zones
data "aws_availability_zones" "available" {}

# VPC--------------------------------------------------------------------------------------
resource "aws_vpc" "main" {
  cidr_block = var.cidr
  enable_dns_hostnames = true
  enable_dns_support = true

  tags = merge( { Name = var.name }, var.tags )
}

# Internet Gateway-------------------------------------------------------------------------
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = merge( { Name = "${var.name}-igw" }, var.tags )
}

# Nat Gateway------------------------------------------------------------------------------
resource "aws_eip" "nat" {
  vpc = true
  count = length(var.private_subnets)

  tags = merge( { Name = "${var.name}-nat-${count.index + 1}" }, var.tags )
}

resource "aws_nat_gateway" "nat" {
  count = length(var.private_subnets)
  subnet_id = aws_subnet.public[count.index].id
  allocation_id = aws_eip.nat[count.index].id
  depends_on = [aws_internet_gateway.main]

  tags = merge( { Name = "${var.name}-nat-${count.index + 1}" }, var.tags )
}

# Public routes----------------------------------------------------------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = merge( { Name = var.name }, var.tags )
}

# Private routes---------------------------------------------------------------------------
resource "aws_route_table" "private" {
  count = length(var.private_subnets)
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id =  aws_nat_gateway.nat[count.index].id
  }

  tags = merge( { Name = var.name }, var.tags )
}

# Public subnet----------------------------------------------------------------------------
resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = var.public_subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true

  tags = merge( { Name = "${var.name}-public-${count.index + 1}" }, var.tags )
}

# Private subnet---------------------------------------------------------------------------
resource "aws_subnet" "private" {
  count = length(var.private_subnets)
  vpc_id = aws_vpc.main.id
  cidr_block = var.private_subnets[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = merge( { Name = "${var.name}-private-${count.index + 1}" }, var.tags )
}

# Route Table Association------------------------------------------------------------------
resource "aws_route_table_association" "public" {
  count  = length(var.public_subnets)
  route_table_id = aws_route_table.public.id
  subnet_id = aws_subnet.public[count.index].id
}

resource "aws_route_table_association" "private" {
  count = length(var.private_subnets)
  route_table_id = aws_route_table.private[count.index].id
  subnet_id = aws_subnet.private[count.index].id
}
