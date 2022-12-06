variable "vnet_name" {
  description = "Virtual Network Name"
  type = string
}

variable "subnet_name" {
  description = "Virtual Network Subnet Name"
  type = string
}

variable "resource_group_name" {
  description = "Resource Group Name"
  type = string
}

variable "inbound_ports_map" {
  type = any
}

variable "subnet_address" {
  description = "Virtual Network Subnet Address Spaces"
  type = list(string)  
}

variable "location" {
  description = "Location"
  type = string
}