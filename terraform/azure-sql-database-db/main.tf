provider "azurerm" {
  features {}
  subscription_id = "1001490f-c77c-403e-be9e-97eac578d1d6"
}

module "sql_database" {
  source              = "../modules/sql-database"
  sql_server_name     = var.sql_server_name
  database_name       = var.database_name
  resource_group_name = var.resource_group_name
  location            = var.location
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  sku_name            = var.sku_name
  collation           = var.collation
  max_size_gb         = var.max_size_gb
  tags                = var.tags
}






