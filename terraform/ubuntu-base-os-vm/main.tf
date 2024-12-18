provider "azurerm" {
  features {}
  subscription_id = "1001490f-c77c-403e-be9e-97eac578d1d6"
}

resource "azurerm_resource_group" "vm_rg" {
  name     = "ubuntu-base-os-vm-rg"
  location = "northeurope"
}

module "ubuntu_base_vm" {
  source              = "../modules/vm"
  vm_name             = "ubuntu-base-os-vm"
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name
  vm_size             = "Standard_D2s_v3"
  admin_username      = "adminuser"
  ssh_public_key_path = "~/.ssh/id_rsa.pub"
  os_offer            = "UbuntuServer"
  os_sku              = "22.04-LTS"
  os_version          = "latest"
}

output "vm_public_ip" {
  value = module.ubuntu_base_vm.vm_public_ip
}

