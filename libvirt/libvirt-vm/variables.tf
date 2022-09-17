variable "user" {
  type = string
  description = "The user to create"
  default = ""
}

variable "hostname" {
  type = string
  description = "The hostname of the system"
  default = ""
}

variable "name" {
  type = string
  description = "Name of the vm"
  default = ""
}

variable "os_image_url" {
  type = string
  description = "Link of the cloud image"
  default = ""
}

variable "vcpu" {
  type = number
  description = "Number of vcpu"
  default = 1
}

variable "memory" {
  type = string
  description = "RAM"
  default = "1024"
}

variable "ssh_key" {
  type = string
  description = "The path to the public key"
  default = ""
}

variable "vm_count" {
  type = number
  description = "Number of vm to deploy"
  default = 1
}