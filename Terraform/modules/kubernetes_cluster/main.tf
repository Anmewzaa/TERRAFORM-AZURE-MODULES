# ================================
# Data
# ================================
data "azurerm_resource_group" "this" {
  name = var.resource_group_name
}

# ================================
# Azure Kubernetes Cluster Resource
# ref : https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/kubernetes_cluster
# ================================

resource "azurerm_kubernetes_cluster" "this" {
  name                = var.kubernetes_cluster_name
  location            = data.azurerm_resource_group.this.location
  resource_group_name = data.azurerm_resource_group.this.name
  dns_prefix          = var.dns_prefix

  dynamic "default_node_pool" {
    for_each = var.default_node_pools
    content {
      name       = default_node_pool.value.name
      node_count = default_node_pool.value.node_count
      vm_size    = default_node_pool.value.vm_size
    }
  }

  network_profile {
    network_plugin = "kubenet"
    network_policy = "calico"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = var.tags
}

resource "azurerm_kubernetes_cluster_node_pool" "this" {
  for_each = { for np in var.user_node_pools : np.name => np }

  name                  = each.value.name
  kubernetes_cluster_id = azurerm_kubernetes_cluster.this.id
  vm_size               = each.value.vm_size
  node_count            = each.value.node_count
  mode                  = lookup(each.value, "mode", "User")
}