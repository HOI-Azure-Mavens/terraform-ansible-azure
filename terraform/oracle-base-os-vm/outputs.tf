output "vm_name" {
  value       = azurerm_linux_virtual_machine.vm.name
  description = "The name of the virtual machine."
}

output "vm_public_ip" {
  value       = azurerm_public_ip.vm_pip.ip_address
  description = "The public IP address of the virtual machine."
}

output "vm_private_ip" {
  value       = azurerm_network_interface.vm_nic.private_ip_address
  description = "The private IP address of the virtual machine."
}

output "resource_group_name" {
  value       = azurerm_resource_group.vm_rg.name
  description = "The name of the resource group."
}

output "virtual_network_name" {
  value       = azurerm_virtual_network.vm_vnet.name
  description = "The name of the virtual network."
}

output "subnet_name" {
  value       = azurerm_subnet.vm_subnet.name
  description = "The name of the subnet."
}

output "private_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
  description = "The private SSH key for the virtual machine."
}


