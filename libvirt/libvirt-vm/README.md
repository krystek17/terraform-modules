# Terraform Libvirt module

## Example

```terraform
terraform {
 required_version = ">= 0.13"
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.2"
    }
  }
}

# instance the provider
provider "libvirt" {
  uri = "qemu:///system"
}



module "libvirt_vm" {
  source       = "<module_path>"
  name         = "ubuntu"
  user         = "tf"
  hostname     = "node"
  os_image_url = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
  vcpu         = 1
  memory       = "1024"
  ssh_key      = "path_to_public_key"
  vm_count     = 1
}
```
