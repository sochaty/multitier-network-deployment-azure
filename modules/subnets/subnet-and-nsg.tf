# Resource-1: Create Subnet
resource "azurerm_subnet" "netsubnet" {
  name                 = "${var.vnet_name}-${var.subnet_name}"
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.vnet_name
  address_prefixes     = var.subnet_address  
}

# Resource-2: Create Network Security Group (NSG)
resource "azurerm_network_security_group" "subnet_nsg" {
  name                = "${azurerm_subnet.netsubnet.name}-nsg"
  location            = var.location
  resource_group_name = var.resource_group_name
}

# Resource-3: Associate NSG and Subnet
resource "azurerm_subnet_network_security_group_association" "subnet_nsg_associate" {
  depends_on = [ azurerm_network_security_rule.nsg_rule_inbound] # Every NSG Rule Association will disassociate NSG from Subnet and Associate it, so we associate it only after NSG is completely created - Azure Provider Bug https://github.com/terraform-providers/terraform-provider-azurerm/issues/354    
  subnet_id                 = azurerm_subnet.netsubnet.id
  network_security_group_id = azurerm_network_security_group.subnet_nsg.id
}

# Resource-4: Create NSG Rules
## NSG Inbound Rule for WebTier Subnets
resource "azurerm_network_security_rule" "nsg_rule_inbound" {
  for_each = var.inbound_ports_map
  name                        = "Rule-Port-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value 
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = var.resource_group_name
  network_security_group_name = azurerm_network_security_group.subnet_nsg.name
}