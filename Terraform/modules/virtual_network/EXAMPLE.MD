### main.tf

```
module "virtual_network" {
  source = "./modules/virtual_network"

  # Virtual Network Configuration
  resource_group_name  = var.resource_group_name
  virtual_network_name = var.virtual_network_name
  address_space        = ["10.0.0.0/16"]

  subnets = [
    {
      name             = "subnet-1"
      address_prefixes = ["10.0.1.0/24"]
    },
    {
      name             = "subnet-2"
      address_prefixes = ["10.0.2.0/24"]
      security_group   = "nsg-tst-anmew"
    }
  ]

  tags = {
    environment = "development"
  }
}
```

### variables.tf

```
# ================================
# Virtual Network Configuration Variables
# ================================
# REQUIRED
variable "virtual_network_name" {
  type        = string
  description = "(Required) The name of the virtual network. Changing this forces a new resource to be created."
}
variable "resource_group_name" {
  type        = string
  description = "(Required) The name of the resource group in which to create the virtual network. Changing this forces a new resource to be created."
}
variable "address_space" {
  type        = list(string)
  description = "(Required)"
  default     = []
}
variable "subnets" {
  type = list(object({
    name             = string
    address_prefixes = list(string)
    security_group   = optional(string)
  }))
  description = "List of subnets (inline on VNet)"
  default = []
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
  default     = {}
}
```
