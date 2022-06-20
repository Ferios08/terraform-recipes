
# Create the VM's Public IP
resource "azurerm_public_ip" "public_ip" {
  name                = "${var.vm_name}_pip"
  location            = var.region
  resource_group_name = var.resource_group_name
  allocation_method   = "Dynamic"
  sku                 = "Basic"
}

resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.vm_name}_nic"
  location            = var.region
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

# Define the VM now :)

# Bootstrapping Template File
data "template_file" "nginx_vm_cloud_init" {
  template = file("scripts/install-nginx.sh")
}

resource "azurerm_linux_virtual_machine" "vm1" {
  name                  = "${var.vm_name}"
  location              = var.region
  resource_group_name   = var.resource_group_name
  network_interface_ids = [azurerm_network_interface.vm_nic.id]
  size                  = "Standard_B1s"
  admin_username        = "ferios"
  admin_password        = "Password123!"
  disable_password_authentication = false
  #admin_ssh_key {
  #  username   = "ferios"
  #  public_key = file("~/.ssh/id_rsa.pub")
  #}

  custom_data = base64encode(data.template_file.nginx_vm_cloud_init.rendered)

  source_image_reference {
    publisher = var.image.publisher
    offer     = var.image.offer
    sku       = var.image.sku
    version   = var.image.version
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
}