data "azurerm_resource_group" "example" {
  name = "TerraformExample01"
}
data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "example" {
  name                        = "examplekeyvault24"
  location                    = var.location
  resource_group_name        =   azurerm_resource_group.example.name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get",
    ]

    secret_permissions = [
 "Backup", "Delete" , "List", "Purge", "Recover", "Restore" , "Set",
     ]

    storage_permissions = [
            "Get",
    ]
  }
}