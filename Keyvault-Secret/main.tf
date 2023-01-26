data "azurerm_key_vault" "example" {
  name                = "examplekeyvault"
  resource_group_name = var.resource_group_name
}
resource "random_password" "vmpassword" {
  length = 20
  special = true
}

resource "azurerm_key_vault_secret" "vmpassword" {
  name         = "vmpassword"
  value        = random_password.vmpassword.result
  key_vault_id = azurerm_key_vault.example.id
  depends_on = [ azurerm_key_vault.example ]
}