terraform {
  backend "azurerm" {
    storage_account_name = "stgterraform1733689608"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
    resource_group_name  = "rg-ansible-terraform-backend"
  }
}


