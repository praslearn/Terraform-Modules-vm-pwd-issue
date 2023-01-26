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
module "NSG" {
  source = "./NSG"
  base_name = "TerraformExample01"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = "West US"
}
module "VirtualNetwork" {
  source = "./VirtualNetwork"
  base_name = "TerraformExample01"
  resource_group_name = module.ResourceGroup.rg_name_out
  depends_on = [module.NSG]
  location = "West US"
}
module "NetworkInterface"{
  source = "./NetworkInterface"
  base_name = "TerraformExample01"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = "West US"
  depends_on = [module.VirtualNetwork, module.Subnet]
}
module "ApplicationInsights"{
  source = "./ApplicationInsights"
  base_name = "TerraformExample01"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = "West US"
}
module "Subnet"{
  source = "./Subnet"
  base_name = "TerraformExample01"
  resource_group_name = module.ResourceGroup.rg_name_out
  virtual_network_name = module.VirtualNetwork.vnet_name_out
  location = "West US"
}
module "Keyvault"{
  source = "./Keyvault"
  base_name = "TerraformExample01"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = "West US"
  depends_on =[module.ResourceGroup]
}
module "Keyvault-Secret"{
  source = "./Keyvault-Secret"
  resource_group_name = module.ResourceGroup.rg_name_out
  depends_on =[module.ResourceGroup ,module.Keyvault]
}

module "PublicIP"{
  source = "./PublicIP"
  base_name = "TerraformExample01"
  resource_group_name = module.ResourceGroup.rg_name_out
  location = "West US"
}

module "VM-Linux"{
  source = "./Compute/VM-Linux"
  base_name = "TerraformExample01"
  resource_group_name = module.ResourceGroup.rg_name_out
  virtual_network_name = module.VirtualNetwork.vnet_name_out
  subnet_name   = module.Subnet.subnet_name_out
  location = "West US"
    depends_on = [module.VirtualNetwork, module.Subnet,module.NetworkInterface,module.PublicIP,module.Keyvault,module.Keyvault-Secret]
}

