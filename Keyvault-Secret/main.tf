data "azurerm_key_vault" "example" {
  name                = "examplekeyvault24"
  resource_group_name = var.resource_group_name
}
resource "random_password" "vmpassword" {
  length = 20
  special = true
}

resource "azurerm_key_vault_secret" "vmpassword" {
  name         = "vmpassword"
  value        = random_password.vmpassword.result
  key_vault_id = data.azurerm_key_vault.example.id
  depends_on   =[ data.azurerm_key_vault.example]
}