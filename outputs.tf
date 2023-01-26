output "RgName" {
  value = module.ResourceGroup.rg_name_out
}

output "StgActName" {
  value = module.StorageAccount.stg_act_name_out
}

output "VnetName" {
  value = module.VirtualNetwork.vnet_name_out
}

output "KeyvaultName" {
  value = module.Keyvault.keyvault_name_out
}
output "KvsecretName" {
  value = module.Keyvault.kv_secret_name_out
}
