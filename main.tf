terraform {
required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.15.00"
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


module "VirtualNetwork" {
  source = "./VirtualNetwork"
  base_name = "TerraformExample01"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = "West US"
}



module "MySQL-Server"{
  source = "./Databases/MySQL-Server"
  base_name = "TerraformExample01"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = "West US"
}
/*
module "NetworkSecurityGroup" {
  source = "./NetworkSecurityGroup"
  base_name = "TerraformExample01"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = "West US"
}



module "Subnet" {
source = "./Subnet"
base_name = "TerraformExample01"
resource_group_name = module.ResourceGroup.rg_name_out
location = "West US"
virtual_network_name = module.VirtualNetwork.vnet_name_out
}

module "NetworkInterface" {
  source = "./NetworkInterface"
  base_name = "TerraformExample01"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = "West US"
    depends_on = [module.Subnet]

}
module "VirtualMachine-Win" {
  source = "./VirtualMachine-Win"
  base_name = "TerraformExample01"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = "West US"
  depends_on = [module.NetworkInterface]

}
*/