data "azurerm_subnet" "example" {
  name                 = "backend"
  virtual_network_name = "example-network"
  resource_group_name  = var.resource_group_name
}

