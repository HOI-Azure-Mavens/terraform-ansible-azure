variable "server_id" {
  description = "The resource ID of the SQL Server."
  type        = string
}

variable "database_name" {
  description = "The name of the database to create."
  type        = string
}

variable "sku_name" {
  description = "The pricing tier (SKU) for the database."
  type        = string
}

variable "collation" {
  description = "The collation setting for the database."
  type        = string
  default     = "SQL_Latin1_General_CP1_CI_AS"
}

variable "max_size_gb" {
  description = "The maximum size of the database in GB."
  type        = number
  default     = 5
}

variable "tags" {
  description = "A map of tags to assign to the database."
  type        = map(string)
  default     = {}
}





