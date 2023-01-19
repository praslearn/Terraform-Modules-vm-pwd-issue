resource "azurerm_subnet" "example" {
  name                 = "internal"
  resource_group_name  = var.resource_group_name
  address_prefixes     = ["10.0.2.0/24"]
}