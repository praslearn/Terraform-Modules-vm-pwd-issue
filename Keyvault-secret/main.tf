resource "azurerm_key_vault_secret" "example" {
  name         = "vm-secret"
  value        = "prasath"
  key_vault_id = azurerm_key_vault.example.id
}