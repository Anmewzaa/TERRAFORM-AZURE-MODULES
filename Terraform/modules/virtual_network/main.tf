# ================================
# Data
# ================================
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}
data "azurerm_network_security_group" "this" {
  for_each            = { for s in var.subnets : s.security_group => s if contains(keys(s), "security_group") && s.security_group != null }
  name                = each.key
  resource_group_name = data.azurerm_resource_group.this.name
}

# ================================
# Virtual Network Resource
# ================================
resource "azurerm_virtual_network" "this" {
  name                = var.virtual_network_name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  address_space       = var.address_space

  dynamic "subnet" {
    for_each = var.subnets

    content {
      name             = subnet.value.name
      address_prefixes = subnet.value.address_prefixes

      security_group = (
        contains(keys(subnet.value), "security_group") && subnet.value.security_group != null ? data.azurerm_network_security_group.this[subnet.value.security_group].id : null
      )
    }
  }

  tags = var.tags
}