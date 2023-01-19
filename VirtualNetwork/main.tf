resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  address_space       = ["10.0.0.0/16"]
  resource_group_name  = var.resource_group_name
  location = var.location
}