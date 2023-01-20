resource "azurerm_application_insights" "example" {
  name                = "tf-test-appinsights"
  location            = var.location
  resource_group_name = var.resource_group_name
  application_type    = "web"
}

