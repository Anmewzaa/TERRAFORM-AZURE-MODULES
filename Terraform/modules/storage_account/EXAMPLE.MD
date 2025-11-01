### main.tf

```
module "storage_account" {
  source = "./modules/storage_account"

  # Storage Account Configuration
  resource_group_name      = var.resource_group_name
  storage_account_name     = var.storage_account_name

  account_tier             = var.account_tier
  account_replication_type = var.account_replication_type

  tags = var.tags
}
```

### variables.tf

```
# ================================
# Storage Account Configuration Variables
# ================================
# REQUIRED
variable "storage_account_name" {
  type        = string
  description = " (Required) Specifies the name of the storage account. Only lowercase Alphanumeric characters allowed. Changing this forces a new resource to be created. This must be unique across the entire Azure service, not just within the resource group."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created."
}
# OPTIONAL
variable "account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid."
  type        = string
  validation {
    condition     = contains(["Standard", "Premium"], var.account_tier)
    error_message = "account_tier must be either 'Standard' or 'Premium'"
  }
}

variable "account_replication_type" {
  description = "Specifies the replication type for the Azure Storage Account. Valid options: LRS, GRS, RAGRS, ZRS, GZRS, RA-GZRS."
  type        = string
  default     = "LRS"
  validation {
    condition     = contains(["LRS", "GRS", "RAGRS", "ZRS", "GZRS", "RA-GZRS"], var.account_replication_type)
    error_message = "account_replication_type must be one of: LRS, GRS, RAGRS, ZRS, GZRS, RA-GZRS"
  }
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
  default     = {}
}
```
