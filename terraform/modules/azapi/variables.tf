variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region where the resources will be deployed."
  type        = string
  default     = "East US"
}

variable "resource_name" {
  description = "The name of the Azure custom resource."
  type        = string
}

variable "resource_type" {
  description = "The type of Azure resource (e.g., Microsoft.Automation/automationAccounts@2021-06-22)."
  type        = string
}

variable "resource_body" {
  description = "The body configuration for the custom resource."
  type        = any
}
