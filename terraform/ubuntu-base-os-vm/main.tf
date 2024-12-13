provider "azurerm" {
  features {}
  subscription_id = "1001490f-c77c-403e-be9e-97eac578d1d6"
}

module "ubuntu_base_vm" {
  source              = "../modules/vm"
  vm_name             = "ubuntu-base-os-vm"
  location            = "northeurope"
  resource_group_name = "ubuntu-base-os-vm-rg"
  vm_size             = "Standard_D2s_v3"
  admin_username      = "adminuser"
  ssh_public_key_path = "~/.ssh/id_rsa.pub"
  os_offer            = "0001-com-ubuntu-server-jammy"
  os_sku              = "22_04-lts-gen2"
  os_version          = "latest"
}

output "vm_public_ip" {
  value = module.ubuntu_base_vm.vm_public_ip
}

