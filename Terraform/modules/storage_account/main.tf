# ================================
# Data
# ================================
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

# ================================
# Storage Account Resource
# ref : https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/storage_account
# ================================

resource "azurerm_storage_account" "this" {
  name                     = var.storage_account_name
  resource_group_name      = data.azurerm_resource_group.this.name
  location                 = data.azurerm_resource_group.this.location
  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = var.tags
}