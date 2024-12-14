resource "azurerm_postgresql_flexible_server" "postgresql_server" {
  name                = "hoi-postgresql-server"
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name   = "GP_Standard_D2s_v3" # Valid SKU for PostgreSQL Flexible Server
  storage_mb = var.storage_mb
  version    = var.postgresql_version

  administrator_login     = var.admin_username
  administrator_password  = var.admin_password

  tags = var.tags
}

resource "azurerm_postgresql_flexible_server_database" "postgresql_database" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.postgresql_server.id
  charset   = "UTF8"
  collation = "C" # Valid collation for PostgreSQL Flexible Server
}








