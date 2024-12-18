output "container_group_fqdn" {
  description = "The fully qualified domain name of the container group"
  value       = azurerm_container_group.aci.fqdn
}

output "container_group_ip" {
  description = "The IP address of the container group"
  value       = azurerm_container_group.aci.ip_address
}

output "container_group_id" {
  description = "The ID of the container group"
  value       = azurerm_container_group.aci.id
}
