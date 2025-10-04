### main.tf

```
module "resource_group" {
  source = "./modules/resource_group" # Don't forget to set the module source path correctly

  resource_group_name = var.resource_group_name

  location = var.location
  tags = var.tags
}
```

### variables.tf

```
# ================================
# Resource Group Configuration Variables
# ================================
# REQUIRED
variable "resource_group_name" {
  type        = string
  description = "(Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
}
variable "location" {
  type        = string
  description = "(Required) The Name which should be used for this Resource Group. Changing this forces a new Resource Group to be created."
}
# OPTIONAL
variable "managed_by" {
  type        = string
  description = "(Optional) The ID of the resource or application that manages this Resource Group."
  default     = null
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
  default     = {}
}
```
