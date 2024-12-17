output "container_app_fqdn" {
  description = "The FQDN of the container app ingress."
  value       = { for k, v in azurerm_container_app.container_app : k => v.ingress[0].fqdn }
}

output "container_app_ips" {
  description = "The IP addresses of the container app."
  value       = { for k, v in azurerm_container_app.container_app : k => v.latest_revision_fqdn }
}




