resource "azurerm_virtual_network" "example" {
  name                = "${var.base_name}-VNet"
  address_space       = ["10.0.0.0/16"]
  resource_group_name  = var.resource_group_name
  location = var.location
  depends_on = [
    azurerm_resource_group.name
 ]
}


