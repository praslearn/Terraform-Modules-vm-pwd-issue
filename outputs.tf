output "RgName" {
  value = module.ResourceGroup.rg_name_out
}

output "StgActName" {
  value = module.StorageAccount.stg_act_name_out
}

output "VnetName" {
  value = module.VirtualNetwork.vnet_name_out
}

output "MysqlserverName" {
  value = module.azurerm_mysql_server.mysqlserver_name_out
}