provider "azurerm" {
  features {}
  subscription_id = "1001490f-c77c-403e-be9e-97eac578d1d6"
}

resource "azurerm_resource_group" "sql_rg" {
  name     = var.resource_group_name
  location = var.location
}

module "postgresql" {
  source              = "../modules/postgresql"
  server_name         = var.server_name
  location            = var.location
  resource_group_name = azurerm_resource_group.sql_rg.name
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  database_name       = var.database_name
  sku_name            = var.sku_name
  postgresql_version  = var.postgresql_version
  storage_mb          = var.storage_mb
  collation           = var.collation
  tags                = var.tags
}




