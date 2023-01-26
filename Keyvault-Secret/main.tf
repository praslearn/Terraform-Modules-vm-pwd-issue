data "azurerm_key_vault" "example" {
  name                = "examplekeyvault24"
  resource_group_name = var.resource_group_name
}
resource "random_password" "vmpassword" {
  length = 20
  special = true
}

resource "azurerm_key_vault_secret" "example" {
  name         = "vmpassword"
  value        = "${random_password.vmpassword.result}Az24"
  key_vault_id = data.azurerm_key_vault.example.id
}