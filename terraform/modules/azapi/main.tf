terraform {
  required_providers {
    azapi = {
      source  = "Azure/azapi"
      version = "~> 1.8" # Latest compatible version
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# Resource Group (Using azurerm provider)
resource "azurerm_resource_group" "example" {
  name     = var.resource_group_name
  location = var.location
}

# Example Custom Azure Resource (Using azapi provider)
resource "azapi_resource" "custom_resource" {
  type      = var.resource_type
  name      = var.resource_name
  parent_id = azurerm_resource_group.example.id
  location  = azurerm_resource_group.example.location

  body = var.resource_body
}


