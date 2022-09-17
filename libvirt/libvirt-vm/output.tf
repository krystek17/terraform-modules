output "ip" {
  value = libvirt_domain.domain.*.network_interface.0.addresses.0
}

output "user" {
  value = var.user
}
