terraform {
  backend "azurerm" {
    resource_group_name  = "terraform-backend-rg"
    storage_account_name = "stgansiter01"
    container_name       = "tfstate"
    key                  = "debian-vm.tfstate"
  }
}
