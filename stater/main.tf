terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "= 3.10.0"

    }
  }
}
provider "azurerm" {
  features {}
}



module "stater" {
  source = "../modules/stater"
  region = "West Europe"
  rg_name = "tfstate_rg"
  storage_account_name = "tfstate20220616"
  container_name = "tfstate"

}
