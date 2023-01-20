data "azurerm_network_interface" "example" {
  name                = "acctest-nic"
  resource_group_name = var.resource_group_name
}

