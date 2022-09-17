# Terraform Libvirt module

## Example

```terraform
module "libvirt_vm"
  source  = "<module_path>"
  name  = "ubuntu"
  user  = "tf"
  hostname  = "node"
  os_image_url  = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
  vcpu  = 1
  memory  = "1024"
  ssh_key = "path_to_public_key"
  vm_count  = 1
```
