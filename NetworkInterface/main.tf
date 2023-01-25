data "azurerm_virtual_network" "example" {
  name                = "example-network"
  resource_group_name = var.resource_group_name
}

data "azurerm_subnet" "example" {
  name                 = "example-subnet"
  virtual_network_name = "example-network"
  resource_group_name  = var.resource_group_name
}
data "azurerm_public_ip" "example" {
  name                = "acceptanceTestPublicIp1"
  resource_group_name = var.resource_group_name
}
resource "azurerm_network_interface" "example" {
  name                = "example-nic"
  location            = var.location
  resource_group_name = var.resource_group_name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.example.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.example.id
  }
}