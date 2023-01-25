output "secret_name_out" {
  value = resource.azurerm_key_vault_secret.example.name
}