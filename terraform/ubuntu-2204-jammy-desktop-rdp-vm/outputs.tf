output "resource_group_name" {
  value = azurerm_resource_group.vm_rg.name
}

output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "vm_public_ip" {
  value = azurerm_public_ip.vm_pip.ip_address
}