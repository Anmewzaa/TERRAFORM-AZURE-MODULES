# ================================
# Provider Configuration Variables
# ================================
variable "client_id" { type = string }
variable "client_secret" { type = string }
variable "tenant_id" { type = string }
variable "subscription_id" { type = string }

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

# ================================
# Virtual Network Configuration Variables
# ================================
# REQUIRED
variable "virtual_network_name" {
  type        = string
  description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
}