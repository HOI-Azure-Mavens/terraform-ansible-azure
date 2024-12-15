output "sql_database_id" {
  description = "The ID of the SQL Database."
  value       = module.sql_database.sql_database_id
}

output "sql_server_fqdn" {
  description = "The fully qualified domain name of the SQL Server."
  value       = azurerm_mssql_server.sql_server.fully_qualified_domain_name
}

output "sql_admin_username" {
  description = "The administrator username for the SQL Server."
  value       = var.admin_username
}

output "sql_admin_password" {
  description = "The administrator password for the SQL Server."
  value       = var.admin_password
  sensitive   = true
}


