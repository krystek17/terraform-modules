# Terraform Vpc module
## Example configuration
```terraform
module "vpc" {
  source = ""
  name  = ""
  cidr = ""
  public_subnet = [ "" ] 
  private_subnet = [ "" ]
  tags  = {}
}
```
