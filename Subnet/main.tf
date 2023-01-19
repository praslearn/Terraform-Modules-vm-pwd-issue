resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = var.resource_group_name
  security_group = azurerm_network_security_group.example.id
  virtual_network_name = "${azurerm_virtual_network.example.name}"
  address_prefixes     = ["10.0.2.0/24"]
}