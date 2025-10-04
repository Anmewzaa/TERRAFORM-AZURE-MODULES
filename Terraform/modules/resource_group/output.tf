output "azurerm_resource_group_id" {
  description = "The id of the Resource Group"
  value       = azurerm_resource_group.this.id
}

output "azurerm_resource_group_name" {
  description = "The name of the Resource Group"
  value       = azurerm_resource_group.this.name
}

output "azurerm_resource_group_location" {
  description = "The location of the Resource Group"
  value       = azurerm_resource_group.this.location
}

output "azurerm_resource_group_tags" {
  description = "The tags of the Resource Group"
  value       = azurerm_resource_group.this.tags
}