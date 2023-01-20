data "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = var.resource_group_name
}



data "azurerm_subnet" "example" {
  name                 = "backend"
  virtual_network_name = "example-network"
  resource_group_name  = var.resource_group_name
}

data "azurerm_network_interface" "example" {
  name                = "example-nic"
  resource_group_name = var.resource_group_name
}


resource "azurerm_windows_virtual_machine" "example" {
  name                = "example-machine"
  location            = var.location
  resource_group_name = var.resource_group_name
  size                = "Standard_F2"
  admin_username      = "adminuser"
  admin_password      = "P@$$w0rd1234!"
  network_interface_ids = [
    azurerm_network_interface.example.id,
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter"
    version   = "latest"
  }
}