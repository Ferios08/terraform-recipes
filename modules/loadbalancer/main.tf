data "azurerm_subscription" "current" {}

resource "azurerm_public_ip" "lb_pub_ip" {
  name                = "lb_pub_ip"
  location            = var.region
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku = "Standard"
}

resource "azurerm_lb" "web_lb" {
  name                = "web_lb"
  location            = var.region
  resource_group_name = var.resource_group_name
  sku = "Standard"
  

  frontend_ip_configuration {
    name                 = "lb_pub_ip"
    public_ip_address_id = azurerm_public_ip.lb_pub_ip.id
  }
}

resource "azurerm_lb_backend_address_pool" "lb_backend" {
  loadbalancer_id = azurerm_lb.web_lb.id
  name            = "BackEndAddressPool"
  depends_on      = [azurerm_lb.web_lb]
}

resource "azurerm_lb_backend_address_pool_address" "lb_backend_web1" {
  name                    = "lb_backend_web1"
  backend_address_pool_id = azurerm_lb_backend_address_pool.lb_backend.id
  virtual_network_id      = var.vnet
  ip_address              = var.priv_ip1
  depends_on      = [azurerm_lb.web_lb]
}

resource "azurerm_lb_rule" "web_rule" {
  loadbalancer_id                = azurerm_lb.web_lb.id
  name                           = "http_rule"
  protocol                       = "Tcp"
  frontend_port                  = 80
  backend_port                   = 80
  frontend_ip_configuration_name = azurerm_lb.web_lb.frontend_ip_configuration[0].name
  backend_address_pool_ids = [azurerm_lb_backend_address_pool.lb_backend.id]
}