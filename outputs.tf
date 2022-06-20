# The Name of the Ressource Group
output "rg_name" {
  description = "Name of the Ressource Group"
  value       = module.network.rg_name
}


# The Name of the Security Group
output "sg_name" {
  description = "Name of the Ressource Group"
  value       = module.network.sg_name
}



# The ID of the Virtual Network
output "vnet_id" {
  description = "Id of the Virtual Network"
  value       = module.network.vnet_id
}

# The Id of the Subnet
output "default_subnet" {
  description = "Id of the Subnet"
  value       = module.network.subnet_id
}

# The VM's public IP
output "vm_pub_1" {
  value = module.vm1.vm_pub_ip
}

output "vm_prv_1" {
  value = module.vm1.vm_private_ip
}


output "lb_ip_addr" {
  value = module.web_lb.lb_ip_addr
}