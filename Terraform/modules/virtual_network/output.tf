output "azurerm_virtual_network_id" {
  description = "The id of the Virtual Network"
  value       = azurerm_virtual_network.this.id
}

output "azurerm_virtual_network_name" {
  description = "The name of the Virtual Network"
  value       = azurerm_virtual_network.this.name
}

output "azurerm_virtual_network_location" {
  description = "The location of the Virtual Network"
  value       = azurerm_virtual_network.this.location
}

output "azurerm_virtual_network_tags" {
  description = "The tags of the Virtual Network"
  value       = azurerm_virtual_network.this.tags
}