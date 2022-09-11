# Terraform Security group module
## Example configuration

```terraform
module "security_group" {
  source = "../../../modules/security_group"
  name  = ""
  vpc_id  = "" 
  ingress = []
  ingress_cidr_block = []
  tags = {}
}
```