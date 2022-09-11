# Terraform ec2 module
## Example configuration

```terraform
module "ec2" {
  source = "../../../modules/ec2"
  name = ""
  instance_type = ""
  owners = [] 
  image = []
  key_name = "test"
  availability_zone = module.vpc.availability_zone
  vpc_security_group_ids = [module.security_group.security_group_id]
  subnet_id = module.vpc.public_subnet[0]
  tags = {}
}
```