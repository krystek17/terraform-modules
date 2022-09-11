data "aws_ami" "ubuntu" {
  owners      = var.owners
  most_recent = true

  filter {
    name   = "name"
    values = var.image
  }
}

resource "aws_instance" "main" {
  ami = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids
  subnet_id = var.subnet_id
  monitoring = true
  key_name = var.key_name
  tags = merge({ Name = var.name }, var.tags )
}
