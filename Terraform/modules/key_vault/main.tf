# ================================
# Data
# ================================
data "azurerm_client_config" "current" {}

data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

# ================================
# Azure Key vault Resource
# ref : https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault
# ================================

resource "azurerm_key_vault" "this" {
  name                = var.key_vault_name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  tenant_id           = data.azurerm_client_config.current.tenant_id

  sku_name = var.sku_name

  # Enable RBAC instead of Access Policies
  rbac_authorization_enabled  = true
  enabled_for_disk_encryption = true

  soft_delete_retention_days = 7
  purge_protection_enabled   = false
}

resource "azurerm_role_assignment" "this" {
  scope                = azurerm_key_vault.this.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}