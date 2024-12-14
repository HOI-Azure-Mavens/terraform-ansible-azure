output "sql_server_fqdn" {
  value       = module.sql_database.sql_server_fqdn
  description = "The fully qualified domain name of the SQL Server."
}

output "sql_database_id" {
  value       = module.sql_database.sql_database_id
  description = "The ID of the SQL Database."
}



