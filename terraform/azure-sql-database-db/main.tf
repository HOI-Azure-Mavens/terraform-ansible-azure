provider "azurerm" {
  features {}
  subscription_id = "1001490f-c77c-403e-be9e-97eac578d1d6"
}

# Define the resource group
resource "azurerm_resource_group" "sql_rg" {
  name     = "hoi-azure-sql-database-rg"
  location = "northeurope"
}

# Define the MSSQL server resource
resource "azurerm_mssql_server" "sql_server" {
  name                         = "hoi-sql-server"
  resource_group_name          = azurerm_resource_group.sql_rg.name
  location                     = azurerm_resource_group.sql_rg.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  minimum_tls_version         = "1.2"
  public_network_access_enabled = true

  # Remove the connection_policy setting as it's handled automatically
  depends_on = [azurerm_resource_group.sql_rg]

  timeouts {
    create = "60m"
    delete = "60m"
  }
}

# Define the SQL database module
module "sql_database" {
  source              = "../modules/sql-database"
  server_id           = azurerm_mssql_server.sql_server.id
  database_name       = var.database_name
  sku_name            = var.sku_name
  collation           = var.collation
  max_size_gb         = var.max_size_gb
  tags                = var.tags

  depends_on = [azurerm_mssql_server.sql_server]
}

