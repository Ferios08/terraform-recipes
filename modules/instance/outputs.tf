# The VM's public IP
output "vm_pub_ip" {
  value = azurerm_public_ip.public_ip.ip_address
}
output "vm_private_ip" {
  value = azurerm_network_interface.vm_nic.private_ip_address
}