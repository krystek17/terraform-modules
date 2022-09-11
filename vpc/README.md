# Terraform Vpc module
## Example configuration
```terraform
module "vpc" {
  source = ""
  name  = ""
  cidr = ""
  public_subnet_cidr = [ "" ] 
  private_subnet_cidr = [ "" ]
  tags  = {}
}
```