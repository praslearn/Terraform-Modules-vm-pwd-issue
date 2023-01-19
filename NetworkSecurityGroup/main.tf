resource "azurerm_network_security_group" "example" {
  name                = "example-security-group"
  resource_group_name      = var.resource_group_name
  location                 = var.location
}