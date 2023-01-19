data "azurerm_sql_database" "example" {
  name                = "example_db"
  server_name         = "example24-mysqlserver"
  resource_group_name = "example"
}

