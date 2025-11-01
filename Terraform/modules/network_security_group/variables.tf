# ================================
# Network Security Group Configuration Variables
# ================================
# REQUIRED
variable "network_security_group_name" {
  type        = string
  description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created."
}
variable "security_rules" {
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  description = "(Required) A list of security rules to apply to the network security group."
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
  default     = {}
}