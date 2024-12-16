output "server_fqdn" {
  value = azurerm_postgresql_flexible_server.postgresql_server.fqdn
}

output "database_id" {
  value = azurerm_postgresql_flexible_server_database.postgresql_database.id
}

output "admin_username" {
  value = azurerm_postgresql_flexible_server.postgresql_server.administrator_login
}

output "admin_password" {
  value     = azurerm_postgresql_flexible_server.postgresql_server.administrator_password
  sensitive = true
}












