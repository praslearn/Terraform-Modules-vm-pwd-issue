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
variable "virtual_network_name" { 
    type = number
}

