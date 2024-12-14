variable "server_name" {
  description = "Name of the PostgreSQL server"
  type        = string
}

variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "admin_username" {
  description = "PostgreSQL administrator username"
  type        = string
}

variable "admin_password" {
  description = "PostgreSQL administrator password"
  type        = string
  sensitive   = true
}

variable "database_name" {
  description = "Name of the PostgreSQL database"
  type        = string
}

variable "sku_name" {
  description = "SKU name for the PostgreSQL server"
  type        = string
  default     = "GP_Standard_D2s_v3"
}

variable "postgresql_version" {
  description = "Version of PostgreSQL"
  type        = string
  default     = "13"
}

variable "storage_mb" {
  description = "Storage size in MB"
  type        = number
  default     = 32768
}

variable "collation" {
  description = "Collation for the PostgreSQL database"
  type        = string
  default     = "C"
}

variable "tags" {
  description = "Tags for the resources"
  type        = map(string)
  default = {
    environment = "production"
    project     = "hoi-project"
  }
}

