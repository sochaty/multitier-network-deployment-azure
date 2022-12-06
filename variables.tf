# Business Department
variable "business_department" {
  description = "Business Department this Infrastructure belongs"
  type        = string
  default     = "hr"
}
# Environment Variable
variable "environment" {
  description = "Infra Environment"
  type        = string
  default     = "dev"
}

# Azure Resource Group Name 
variable "resource_group_name" {
  description = "Resource Group Name"
  type        = string
  default     = "rg-demo"
}

# Azure Resources Location
variable "resource_group_location" {
  description = "Region in which Azure Resources to be created"
  type        = string
  default     = "westeurope"
}

variable "vnet_name" {
  description = "Virtual Network name"
  type        = string
  default     = "vnet-default"
}
variable "vnet_address_space" {
  description = "Virtual Network address_space"
  type        = list(string)
  default     = ["90.0.0.0/16"]
}

variable "subnets" {
  description = "value"
  type = list(object({
    name    = string
    address = list(string)
    ports   = any
  }))
}