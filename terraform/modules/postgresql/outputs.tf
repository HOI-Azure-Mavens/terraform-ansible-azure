output "postgresql_server_fqdn" {
  value = azurerm_postgresql_flexible_server.postgresql_server.fqdn
}

output "postgresql_database_id" {
  value = azurerm_postgresql_flexible_server_database.postgresql_database.id
}



