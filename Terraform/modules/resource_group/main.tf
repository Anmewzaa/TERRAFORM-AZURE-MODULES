# ================================
# Resource Group Resource
# ref : https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
# ================================

resource "azurerm_resource_group" "this" {
  # REQUIRED
  name     = var.resource_group_name
  location = var.location

  # OPTIONAL
  managed_by = var.managed_by
  tags       = var.tags
}
