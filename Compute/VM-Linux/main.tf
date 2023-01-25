data "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "example" {
  name                 = "example-subnet"
  virtual_network_name = "example-network"
  resource_group_name  = var.resource_group_name
}
data "azurerm_network_interface" "example" {
  name                = "example-nic"
  resource_group_name = var.resource_group_name
}
data "azurerm_public_ip" "example" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = var.resource_group_name
}
data "azurerm_key_vault" "example" {
  name                = ""
  resource_group_name = var.resource_group_name
}
data "azurerm_key_vault_secret" "example" {
  name         = "vmpassword"
  key_vault_id = data.azurerm_key_vault.example.id
}
resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  size                = "Standard_F2"
  disable_password_authentication = false
  admin_username      = var.adminusername
  admin_password      = data.azurerm_key_vault_secret.vmpassword.value
 # admin_username      = "adminuser"
 # admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    data.azurerm_network_interface.example.id,
  ]
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
}