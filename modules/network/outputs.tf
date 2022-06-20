# The Ressource Group name
output "rg_name" {
  description = "Id of the Ressource Group"
  value       = azurerm_resource_group.default_rg.name
}


# The Id of the Security Group
output "sg_name" {
  description = "Id of the Security Group"
  value       = azurerm_network_security_group.default_sg.name
}


# The Id of the Virtual Network
output "vnet_id" {
  description = "Id of the Virtual Network"
  value       = azurerm_virtual_network.default_vnet.id
}

# The Id of the Subnet
output "subnet_id" {
  description = "Id of the Subnet"
  value       = azurerm_subnet.default_subnet.id
}