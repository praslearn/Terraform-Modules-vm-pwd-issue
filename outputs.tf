output "RgName" {
  value = module.ResourceGroup.rg_name_out
}

output "StgActName" {
  value = module.StorageAccount.stg_act_name_out
}

output "VnetName" {
  value = module.VirtualNetwork.vnet_name_out
}

output "MysqldbName" {
  value = module.azurerm_mssql_database.mysqldb_name_out
}