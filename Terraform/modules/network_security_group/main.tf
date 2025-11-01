# ================================
# Data
# ================================
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

# ================================
# Network Security Group Resource
# ref : https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/network_security_group
# ================================

resource "azurerm_network_security_group" "this" {
  name                = var.network_security_group_name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name

  dynamic "security_rule" {
    for_each = var.security_rules

    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }

  tags = var.tags
}