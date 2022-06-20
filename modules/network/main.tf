resource "azurerm_resource_group" "default_rg" {
  name     = "default_terraform_rg"
  location = var.region
}

resource "azurerm_network_security_group" "default_sg" {
  name                = "default_security_group"
  location            = azurerm_resource_group.default_rg.location
  resource_group_name = azurerm_resource_group.default_rg.name

  security_rule {
    name = "Allow-HTTP"
    description = "Allow HTTP"
    priority = 110
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "80"
    source_address_prefix = "Internet"
    destination_address_prefix = "*"
  }
}

resource "azurerm_virtual_network" "default_vnet" {
  name                = "default_vnet"
  address_space       = ["10.0.0.0/16"]
  location            = var.region
  resource_group_name = azurerm_resource_group.default_rg.name
  depends_on = [
    azurerm_resource_group.default_rg
  ]
}

resource "azurerm_subnet" "default_subnet" {
  name                 = "default_subnet"
  resource_group_name  = azurerm_resource_group.default_rg.name
  virtual_network_name = azurerm_virtual_network.default_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
  depends_on = [
    azurerm_virtual_network.default_vnet
  ]
}
