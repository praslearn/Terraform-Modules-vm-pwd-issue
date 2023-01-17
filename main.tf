terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "2.88.1"
    }
  }
}
  backend "azurerm" {
    resource_group_name = var.bkstrgrg
    storage_account_name = var.bkstrg
    container_name = var.bkcontainer
    key = var.bkstrgkey
  }
}

provider "azurerm" {
  features {}
}
provider "azurerm" {
  features {
    
  }
}

module "ResourceGroup" {
  source = "./ResourceGroup"
  base_name = "TerraformExample01"
  location = "West US"
}

module "StorageAccount" {
  source = "./StorageAccount"
  base_name = "TerraformExample01"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = "West US"
}