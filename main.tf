terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.10.0"

    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate_rg"
    storage_account_name = "tfstate20220616"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
}



module "network" {
  source = "./modules/network"
  region = "West Europe"

}


module "vm1" {
  source = "./modules/instance"
  region = "West Europe"
  vm_name = "vm1"
  resource_group_name= module.network.rg_name
  subnet_id = module.network.subnet_id
}


module "web_lb" {
  source = "./modules/loadbalancer"
  region = "West Europe"
  vnet = module.network.vnet_id
  priv_ip1= module.vm1.vm_private_ip
  resource_group_name= module.network.rg_name

}