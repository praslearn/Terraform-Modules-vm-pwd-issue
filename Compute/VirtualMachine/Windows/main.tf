data "azurerm_virtual_machine" "example" {
  name                = "production-vm"
  resource_group_name = var.resource_group_name
}

