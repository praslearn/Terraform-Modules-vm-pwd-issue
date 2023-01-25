resource "azurerm_key_vault_secret" "example" {
  name         = "vm-secret"
  value        = "prasath"
  key_vault_id = data.azurerm_key_vault.example.name
}

data "azurerm_key_vault" "example" {
  name                = "examplekeyvault24"
  resource_group_name = "TerraformExample01"
}