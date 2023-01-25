#Create KeyVault VM password
resource "random_password" "vmpassword" {
  length = 20
  special = true
}
#Create Key Vault Secret
resource "azurerm_key_vault_secret" "vmpassword" {
  name         = "vmpassword"
  value        = random_password.vmpassword.result
  key_vault_id = azurerm_key_vault.kv1.id
  depends_on = [ azurerm_key_vault.kv1 ]
}