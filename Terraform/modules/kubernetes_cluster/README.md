### main.tf

```
module "kubernetes_cluster" {
  source = "./modules/kubernetes_cluster"

  # Kubernetes Cluster Configuration
  resource_group_name     = var.resource_group_name
  kubernetes_cluster_name = var.kubernetes_cluster_name
  dns_prefix              = var.dns_prefix

  # System node
  default_node_pools = [
    {
      name       = "system"
      node_count = 1
      vm_size    = "Standard_B2s"
    }
  ]
  # User node
  user_node_pools = [
    {
      name       = "user"
      node_count = 1
      vm_size    = "Standard_B2s"
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
# Kubernetes Cluster Configuration Variables
# ================================
# REQUIRED
variable "resource_group_name" {
  type        = string
  description = "(Required) The Azure Region where the Resource Group should exist. Changing this forces a new Resource Group to be created."
}
variable "kubernetes_cluster_name" {
  type        = string
  description = "(Required) The name of the Managed Kubernetes Cluster to create. Changing this forces a new resource to be created."
}
variable "dns_prefix" {
  type        = string
  description = "(Optional) DNS prefix specified when creating the managed cluster. Possible values must begin and end with a letter or number, contain only letters, numbers, and hyphens and be between 1 and 54 characters in length. Changing this forces a new resource to be created."
}
variable "default_node_pools" {
  description = "List of default node pool configurations"
  type = list(object({
    name       = string
    node_count = number
    vm_size    = string
  }))
  default = []
}
variable "tags" {
  type        = map(string)
  description = "(Optional) A mapping of tags which should be assigned to the Resource Group."
  default     = {}
}
# OPTIONAL
variable "user_node_pools" {
  description = "List of additional user node pools"
  type = list(object({
    name       = string
    node_count = number
    vm_size    = string
    mode       = optional(string, "User") # default User
  }))
  default = []
}
```
