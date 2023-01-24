data "azurerm_key_vault" "example" {
  name                = "examplekeyvault24"
  resource_group_name = var.resource_group_name
}
resource "azurerm_key_vault_secret" "example" {
  name         = "vm-secret"
  value        = "prasath"
  key_vault_id = data.azurerm_key_vault.example.id
  resource_group_name = var.resource_group_name

}