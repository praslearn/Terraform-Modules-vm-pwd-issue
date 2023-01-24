data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "example" {
  name                        = "examplekeyvault24"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  enabled_for_disk_encryption = true
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  soft_delete_retention_days  = 7
  purge_protection_enabled    = false

  sku_name = "standard"

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    key_permissions = [
      "Get","Backup", "Create", "Decrypt", "Delete", "Encrypt", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey",
    ]

    secret_permissions = [
             "Get","Backup", "Create", "Decrypt", "Delete", "Encrypt", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey",
    ]

    storage_permissions = [
            "Get","Backup", "Create", "Decrypt", "Delete", "Encrypt", "Import", "List", "Purge", "Recover", "Restore", "Sign", "UnwrapKey", "Update", "Verify", "WrapKey",
    ]
  }
}