locals {
  owners      = var.business_department
  environment = var.environment
  #   deployment_date = var.deployment_date
  resource_name_prefix = "${var.business_department}-${var.environment}"
  common_tags = {
    owners      = local.owners
    environment = local.environment
    deployment  = formatdate("DD MMM YYYY hh:mm ZZZ", timestamp())
  }
}

# Random String Resource
resource "random_string" "demorandom" {
  length  = 6
  upper   = false
  special = false
  numeric = false
}

# Resource-1: Azure Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "${local.resource_name_prefix}-${var.resource_group_name}-${random_string.demorandom.id}"
  location = var.resource_group_location
  tags     = local.common_tags
}

module "virtual-network" {
  source = "./modules/virtual-network"

  vnet_name            = var.vnet_name
  vnet_address_space   = var.vnet_address_space
  resource_name_prefix = local.resource_name_prefix
  location             = azurerm_resource_group.rg.location
  resource_group_name  = azurerm_resource_group.rg.name
  tags                 = local.common_tags
}

module "subnets" {
  source   = "./modules/subnets"
  for_each = { for each in var.subnets : each.name => each }

  vnet_name           = module.virtual-network.vnet_name
  subnet_name         = each.value.name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  subnet_address      = each.value.address
  inbound_ports_map   = each.value.ports
}