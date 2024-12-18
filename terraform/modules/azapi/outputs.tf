output "resource_id" {
  description = "The ID of the custom resource"
  value       = azapi_resource.custom_resource.id
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.example.name
}


