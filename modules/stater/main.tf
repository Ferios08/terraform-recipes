
resource "azurerm_resource_group" "tfstate_rg" {
  name     = var.rg_name
  location = var.region
}



resource "azurerm_storage_account" "tfstate_storage_account" {
  name                     = var.storage_account_name
  resource_group_name      = azurerm_resource_group.tfstate_rg.name
  location                 = var.region
  account_tier             = "Standard"
  account_replication_type = "LRS"

}

resource "azurerm_storage_container" "tfstate_container" {
  name                  = var.container_name
  storage_account_name  = azurerm_storage_account.tfstate_storage_account.name
  container_access_type = "private"
}

