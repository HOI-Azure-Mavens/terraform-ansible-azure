output "resource_id" {
  description = "The ID of the custom Azure resource."
  value       = azapi_resource.custom_resource.id
}

output "resource_name" {
  description = "The name of the custom Azure resource."
  value       = azapi_resource.custom_resource.name
}
