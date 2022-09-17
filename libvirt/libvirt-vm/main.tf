data "template_file" "user_data" {
  template = file("${path.module}/cloud_init.cfg")
  vars = {
    public_key = file(var.ssh_key)
    hostname  = var.hostname
    user  = var.user
  }
}

data "template_cloudinit_config" "config" {
  gzip = false
  base64_encode = false
  part {
    content = "${data.template_file.user_data.rendered}"
    filename     = "init.cfg"
    content_type = "text/cloud-config"
  }
}


resource "libvirt_cloudinit_disk" "commonit" {
  count = var.vm_count
  name  = "tf-${var.name}-${count.index + 1}-commoninit.iso"
  pool  = "default"
  user_data = data.template_cloudinit_config.config.rendered
}

# Fetch the image from
resource "libvirt_volume" "os_image" {
  count = var.vm_count
  name  = "tf-${var.name}-${count.index + 1}-qcow2"
  pool  = "default"
  source  = var.os_image_url
  format = "qcow2"
}

# Create the machine
resource "libvirt_domain" "domain" {
  count = var.vm_count
  name  = "tf-${var.name}-${count.index + 1}-tf"
  vcpu  = var.vcpu
  memory  = var.memory
  cloudinit = libvirt_cloudinit_disk.commonit[count.index].id

  network_interface {
    network_name  = "default"
    wait_for_lease = true
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_type = "virtio"
    target_port = "1"
  }

  disk {
    volume_id = libvirt_volume.os_image[count.index].id
  }

  graphics {
    type        = "spice"
    listen_type = "address"
    autoport    = true
  }
}