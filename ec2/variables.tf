variable "name" {
  description = "Name of the instance"
  type = string
  default = ""
}

variable "tags" {
  description = "A mapping of tags"
  type = map(string)
  default = {}
}

variable "subnet_id" {
  description = "The ID of the subnet to use for this instance"
  type = string
  default = ""
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default     = ""
}

variable "key_name" {
  description = "Key name of the Key Pair to use for the instance"
  type        = string
  default     = null
}

variable "owners" {
  description = "Owner of the AMI"
  type = list(string)
  default = []
}

variable "image" {
  description = "Name of the AMI"
  type = list(string)
  default     = []
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
  default     = null
}

variable "availability_zone" {
  description = "AZ to start the instance in"
  type        = string
  default     = null
}

variable "user_data" {
  description = ""
  type        = string
  default     = null
}