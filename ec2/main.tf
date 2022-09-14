data "aws_ami" "main" {
  owners      = var.owners
  most_recent = true

  filter {
    name   = "name"
    values = var.image
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
  user_data_replace_on_change = true
  tags = merge({ Name = var.name }, var.tags )
}

