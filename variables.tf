variable "base_name" {
    type = string
    description = "The storage accuont base name"
    default     = "Terraform-Demo"
}
variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
    default     = "Terraform-Demo-RG"
}
variable "location" {
    type = string
    description = "The location for the deployment"
    default     = "East US"
}
variable "azurerm_network_security_group" {
    type = string
    description = "The location for the deployment"
    default     = "Demo-NSG"
}
variable "azurerm_virtual_network" {
    type = string
    description = "The location for the deployment"
    default     = "Demo-Vnet"
}

variable "azurerm_application_insights" {
    type = string
    description = "The location for the deployment"
    default     = "Demo-app-insight"
}
variable "azurerm_storage_account" {
    type = string
    description = "The location for the deployment"
    default     = "Demo-Storage-acc"
}
variable "azurerm_network_interface" {
    type = string
    description = "The location for the deployment"
    default     = "Demo-nic"
}
variable "azurerm_subnet" {
    type = string
    description = "The location for the deployment"
    default     = "Demo-subnet"
}

variable "azurerm_key_vault" {
    type = string
    description = "The location for the deployment"
    default     = "Demo-keyvault"
}
variable "azurerm_key_vault_secret" {
    type = string
    description = "The location for the deployment"
    default     = "Demo-secret"
}
variable "azurerm_public_ip" {
    type = string
    description = "The location for the deployment"
    default     = "Demo-public-ip"
}
variable "azurerm_linux_virtual_machine" {
    type = string
    description = "The location for the deployment"
    default     = "Demo-VM-Linux"
}


