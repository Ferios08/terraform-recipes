variable "region" {
  description = "The Azure region where the Remote Backend will be created"
  type        = string
  default     = "West Europe"
}

variable "rg_name" {
  description = "The Remote backend's Ressource group name"
  type        = string
  default     = "tfstate_rg"
}

variable "storage_account_name" {
  description = "The Azure Storage Account where the Remote Backend will be created"
  type        = string
  default     = "tfstate20220616"
}


variable "container_name" {
  description = "The Azure Storage Container where the Remote Backend will be created"
  type        = string
  default     = "tfstate"
}