resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  resource_group_name  = var.resource_group_name
  location = var.location
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
  }
}