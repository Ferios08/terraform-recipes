variable "region" {
  description = "The Azure region where the Ressource group will be created"
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "The Azure Ressource Group where to deploy the VM"
  type        = string
}


variable "vm_name" {
  description = "The Azure region Virtual Machine Name"
  type        = string
}


variable "subnet_id" {
  description = "The Subnet where the VM will be attached to"
  type        = string
}


variable "image" {
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }

}