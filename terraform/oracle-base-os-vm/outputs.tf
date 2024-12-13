output "vm_name" {
  value       = azurerm_linux_virtual_machine.vm.name
  description = "The name of the Oracle Linux virtual machine."
}

output "vm_public_ip" {
  value       = azurerm_public_ip.vm_pip.ip_address
  description = "The public IP address of the Oracle Linux virtual machine."
}

output "vm_private_ip" {
  value       = azurerm_network_interface.vm_nic.private_ip_address
  description = "The private IP address of the Oracle Linux virtual machine."
}

output "resource_group_name" {
  value       = azurerm_resource_group.vm_rg.name
  description = "The name of the resource group for the Oracle Linux VM."
}

output "virtual_network_name" {
  value       = azurerm_virtual_network.vm_vnet.name
  description = "The name of the virtual network for the Oracle Linux VM."
}

output "subnet_name" {
  value       = azurerm_subnet.vm_subnet.name
  description = "The name of the subnet for the Oracle Linux VM."
}

