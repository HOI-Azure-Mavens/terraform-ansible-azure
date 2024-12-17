variable "resource_group_name" {
  description = "The name of the resource group to create."
  type        = string
}

variable "location" {
  description = "The Azure region where the resource group will be created."
  type        = string
  default     = "East US"
}

variable "resource_name" {
  description = "The name of the custom resource."
  type        = string
}

variable "resource_type" {
  description = "The type of the custom Azure resource."
  type        = string
}

variable "resource_body" {
  description = "The body configuration for the custom resource."
  type        = map(any)
}


