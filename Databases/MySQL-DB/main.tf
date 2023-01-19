resource "azurerm_mssql_server" "example" {
  name                         = "example"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

data "azurerm_mssql_database" "example" {
  name      = "example-mssql-db"
  server_id = azurerm_mssql_server.example.id
}

output "database_id" {
  value = data.azurerm_mssql_database.example.id
}