
# The Id of the Ressource Group
output "tfstate_rg" {
  description = "Id of the Ressource Group"
  value       = azurerm_resource_group.tfstate_rg.id
}


# The Id of the Storage Account
output "tfstate_storage_account" {
  description = "Id of the Storage Account"
  value       = azurerm_storage_account.tfstate_storage_account.id
}

# The Id of the Ressource Group
output "tfstate_container" {
  description = "Id of the Storage Container"
  value       = azurerm_storage_container.tfstate_container.id
}