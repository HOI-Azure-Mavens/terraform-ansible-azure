output "vm_public_ip" {
  description = "The public IP address of the virtual machine"
  value       = azurerm_public_ip.vm_pip.ip_address
}

output "vm_private_ip" {
  description = "The private IP address of the virtual machine"
  value       = azurerm_network_interface.vm_nic.private_ip_address
}

output "vm_name" {
  description = "The name of the virtual machine"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "resource_group_name" {
  description = "The name of the resource group"
  value       = azurerm_resource_group.vm_rg.name
}

output "vnet_name" {
  description = "The name of the virtual network"
  value       = azurerm_virtual_network.vm_vnet.name
}

output "subnet_name" {
  description = "The name of the subnet"
  value       = azurerm_subnet.vm_subnet.name
}

output "admin_username" {
  description = "The admin username for the virtual machine"
  value       = var.admin_username
}

