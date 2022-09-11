variable "name" {
  description = "Name of the vpc"
  type = string
  default = ""
}

variable "tags" {
  description = "A mapping of tags"
  type = map(string)
  default = {}
}

variable "cidr" {
  description = "The CIDR block for the VPC"
  type = string
  default = ""
}

variable "public_subnets" {
  description = "A list of public subnets"
  type = list(string)
  default = []
}

variable "private_subnets" {
  description = "A list of private subnets"
  type = list(string)
  default = []
}