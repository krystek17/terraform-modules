variable "name" {
  description = "Name of the security group"
  type = string
  default = ""
}

variable "tags" {
  description = "A mapping of tags"
  type = map(string)
  default = {}
}

variable "vpc_id" {
  description = "Id of the vpc where the security group is created"
  type = string
  default = ""
}

variable "ingress" {
  description = "Opened ports"
  type = list(string)
  default = []
}

variable "ingress_cidr_block" {
  description = "A list of allowed Ips"
  type = list(string)
  default = []
}
