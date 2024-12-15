provider "azurerm" {
  features {}
  subscription_id = "1001490f-c77c-403e-be9e-97eac578d1d6"
}

# Define the resource group
resource "azurerm_resource_group" "sql_rg" {
  name     = var.resource_group_name
  location = var.location
}

# Define the MSSQL server resource
resource "azurerm_mssql_server" "sql_server" {
  name                         = var.sql_server_name
  resource_group_name          = azurerm_resource_group.sql_rg.name
  location                     = azurerm_resource_group.sql_rg.location
  version                      = "12.0"
  administrator_login          = var.admin_username
  administrator_login_password = var.admin_password
  minimum_tls_version          = "1.2"
  public_network_access_enabled = true

  timeouts {
    create = "60m"
    delete = "60m"
  }
}

# Allow firewall access for testing
resource "azurerm_mssql_firewall_rule" "allow_all_ips" {
  name       = "AllowAllIPs"
  server_id  = azurerm_mssql_server.sql_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "255.255.255.255"
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
}




