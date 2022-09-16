data "aws_ami" "main" {
  owners      = var.owner
  most_recent = true

  filter {
    name   = "name"
    values = var.ami_name
  }
}

resource "aws_instance" "main" {
  ami = data.aws_ami.main.id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = var.subnet_id
  monitoring = true
  key_name = var.key_name
  user_data = var.user_data
  tags = merge({ Name = var.name }, var.tags )
}

resource "aws_eip" "main" {
  vpc = true
  tags = merge({ Name = "${var.name}-eip" })
}

resource "aws_eip_association" "main" {
  instance_id = aws_instance.main.id
  allocation_id = aws_eip.main.id
}