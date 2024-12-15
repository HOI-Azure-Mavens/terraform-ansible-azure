variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region for the resources."
  type        = string
}

variable "sql_server_name" {
  description = "The name of the SQL Server."
  type        = string
}

variable "admin_username" {
  description = "The administrator username for the SQL Server."
  type        = string
}

variable "admin_password" {
  description = "The administrator password for the SQL Server."
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "The name of the SQL Database."
  type        = string
}

variable "sku_name" {
  description = "The pricing tier for the SQL Database."
  type        = string
  default     = "Basic"
}

variable "collation" {
  description = "The collation for the SQL Database."
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "max_size_gb" {
  description = "The maximum size of the database in GB."
  type        = number
  default     = 5
}

variable "tags" {
  description = "Tags to be applied to the resources."
  type        = map(string)
  default     = {}
}





