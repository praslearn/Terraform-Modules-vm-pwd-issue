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
  name                = var.public_ip_name_out
  resource_group_name = var.resource_group_name
}
resource "azurerm_linux_virtual_machine" "example" {
  name                = "example-machine"
  location                    = var.location
  resource_group_name         = var.resource_group_name
  size                = "Standard_F2"
  disable_password_authentication = false
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
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