terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-ansible-terraform-backend"
    storage_account_name = "stgterraform1733689608"
    container_name      = "tfstate"
    key                 = "vm.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "1001490f-c77c-403e-be9e-97eac578d1d6"
}

module "vm" {
  source              = "../../modules/vm"
  vm_name             = "debian-vm"
  location            = "eastus"
  resource_group_name = "debian-vm-rg"
  vm_size            = "Standard_B1s"
  admin_username     = "azureuser"
}















