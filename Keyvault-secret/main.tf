resource "azurerm_key_vault_secret" "example" {
  name         = "vm-secret"
  value        = "prasath"
  key_vault_id = data.azurerm_key_vault.example.name
}

data "azurerm_key_vault" "example" {
  name                = data.azurerm_key_vault.example
  resource_group_name = var.resource_group_name
}