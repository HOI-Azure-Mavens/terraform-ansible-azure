resource "azurerm_postgresql_flexible_server" "postgresql_server" {
  name                = var.server_name
  location            = var.location
  resource_group_name = var.resource_group_name

  sku_name   = "GP_Standard_D2s_v3" # Compatible SKU for High Availability
  storage_mb = var.storage_mb
  version    = var.postgresql_version

  administrator_login    = var.admin_username
  administrator_password = var.admin_password

  high_availability {
    mode                      = "ZoneRedundant"
    standby_availability_zone = "2"
  }

  zone = "1"

  tags = var.tags
}


resource "azurerm_postgresql_flexible_server_database" "postgresql_database" {
  name      = var.database_name
  server_id = azurerm_postgresql_flexible_server.postgresql_server.id
  charset   = "UTF8"
  collation = var.collation
}















