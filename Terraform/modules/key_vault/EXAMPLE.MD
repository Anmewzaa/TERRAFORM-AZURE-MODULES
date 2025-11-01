### main.tf

```
module "key_vault" {
  source = "./modules/key_vault"

  # Key Vault Configuration
  resource_group_name  = module.resource_group.azurerm_resource_group_name
  key_vault_name = "kv-tst-anmew-01"

  sku_name = "standard"
}
```

### variables.tf

```
# ================================
# Key vault Configuration Variables
# ================================
# REQUIRED
variable "resource_group_name" {
  type        = string
  description = "(Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
}
variable "key_vault_name" {
  type        = string
  description = "(Required) Specifies the name of the Key Vault. Changing this forces a new resource to be created. The name must be globally unique. If the vault is in a recoverable state then the vault will need to be purged before reusing the name."
}
variable "sku_name" {
  description = "The Name of the SKU used for this Key Vault. Valid options are 'standard' and 'premium'."
  type        = string
  validation {
    condition     = contains(["standard", "premium"], lower(var.sku_name))
    error_message = "sku_name must be either 'standard' or 'premium'."
  }
}
```
