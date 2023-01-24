resource "azurerm_public_ip" "example" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"

}