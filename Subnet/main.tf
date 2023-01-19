data "azurerm_subnet" "example" {
  name                 = "backend"
  virtual_network_name =  azurerm_virtual_network.example.id
  resource_group_name  = var.resource_group_name
}

