variable "region" {
  description = "The Azure region where the Ressource group will be created"
  type        = string
  default     = "West Europe"
}

variable "vnet" {
  description = "The Azure Vnet where to deploy the LB"
  type        = string
}


variable "priv_ip1" {
  description = "The VM's Priv IP"
  type        = string
}


variable "resource_group_name" {
  description = "The VM's Ressource Group"
  type        = string
}

