output "postgresql_server_fqdn" {
  description = "The fully qualified domain name of the PostgreSQL server."
  value       = module.postgresql.server_fqdn
}

output "postgresql_database_id" {
  description = "The ID of the PostgreSQL database."
  value       = module.postgresql.database_id
}

output "postgresql_admin_username" {
  description = "The administrator username for the PostgreSQL server."
  value       = module.postgresql.admin_username
}

output "postgresql_admin_password" {
  description = "The administrator password for the PostgreSQL server."
  value       = module.postgresql.admin_password
  sensitive   = true
}





