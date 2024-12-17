output "container_app_fqdn" {
  description = "The Fully Qualified Domain Names (FQDNs) of the container apps."
  value       = { for app in azurerm_container_app.container_app : app.name => app.latest_revision_fqdn }
}

output "container_app_ips" {
  description = "The IP addresses of the container apps."
  value       = { for app in azurerm_container_app.container_app : app.name => app.latest_revision_fqdn }
}





