terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.0"
    }
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
  vm_size             = "Standard_B1s"
  admin_username      = "azureuser"
  ssh_public_key_path = "~/.ssh/id_rsa.pub"
  os_offer            = "Debian"
  os_sku              = "10-gen2"
  os_version          = "latest"
}













