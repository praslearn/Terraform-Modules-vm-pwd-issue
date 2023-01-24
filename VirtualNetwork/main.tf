
data "azurerm_network_security_group" "example" {
  name                = "example"
  resource_group_name = var.resource_group_name
}
resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]
  depends_on = [data.azurerm_network_security_group.example.name]
}