terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.50"
    }
  }
  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
  skip_provider_registration = true
}

terraform {
  backend "azurerm" {
    resource_group_name  = "rg-ansible-terraform-backend"  # Updated resource group name
    storage_account_name = "stgterraform1733689608"       # Updated storage account name
    container_name       = "tfstate"                     # No change, container name is the same
    key                  = "terraform.tfstate"            # Updated key for clarity
  }
}
