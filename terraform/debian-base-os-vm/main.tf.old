provider "azurerm" {
  features {}
  subscription_id = "1001490f-c77c-403e-be9e-97eac578d1d6"
}

resource "azurerm_resource_group" "vm_rg" {
  name     = "debian-base-os-vm-rg"
  location = "northeurope"
}

module "debian_base_vm" {
  source              = "../modules/vm"
  vm_name             = "debian-base-os-vm"
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name
  vm_size             = "Standard_D2s_v3"
  admin_username      = "adminuser"
  ssh_public_key_path = "~/.ssh/id_rsa.pub"
  os_offer            = "debian-13-daily"  # Corrected Offer
  os_sku              = "13-gen2"          # Corrected SKU
  os_version          = "0.20241031.1917"  # Use a specific version
}

output "vm_name" {
  value = module.debian_base_vm.vm_name
}

output "vm_public_ip" {
  value = module.debian_base_vm.vm_public_ip
}






