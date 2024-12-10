output "resource_group_name" {
  description = "The name of the Resource Group"
  value       = azurerm_resource_group.vm_rg.name
}

output "vm_name" {
  description = "The name of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.name
}

output "vm_public_ip" {
  description = "The public IP address of the virtual machine"
  value       = azurerm_public_ip.vm_pip.ip_address
}

output "virtual_network_name" {
  description = "The name of the Virtual Network"
  value       = azurerm_virtual_network.vm_vnet.name
}

output "subnet_name" {
  description = "The name of the Subnet"
  value       = azurerm_subnet.vm_subnet.name
}

output "network_interface_id" {
  description = "The ID of the Network Interface"
  value       = azurerm_network_interface.vm_nic.id
}

output "admin_username" {
  description = "The admin username for the VM"
  value       = azurerm_linux_virtual_machine.vm.admin_username
}

output "vm_size" {
  description = "The size of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.size
}

output "vm_location" {
  description = "The location of the Virtual Machine"
  value       = azurerm_linux_virtual_machine.vm.location
}


