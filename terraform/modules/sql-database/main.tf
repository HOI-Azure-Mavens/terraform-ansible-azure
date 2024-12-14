resource "azurerm_mssql_database" "database" {
  name        = var.database_name
  server_id   = var.server_id
  sku_name    = var.sku_name
  collation   = var.collation
  max_size_gb = var.max_size_gb
  tags        = var.tags
}

