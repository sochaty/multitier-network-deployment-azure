## Virtual Network
variable "vnet_name" {
  description = "Virtual Network name"
  type = string  
}
variable "vnet_address_space" {
  description = "Virtual Network address_space"
  type = list(string)  
}

variable "resource_name_prefix" {
  description = "Virtual Network Name Prefix"
  type = string
}

variable "location" {
  description = "Virtual Network Location"
  type = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type = string
}

variable "tags" {
  description = "Common tags"   
}