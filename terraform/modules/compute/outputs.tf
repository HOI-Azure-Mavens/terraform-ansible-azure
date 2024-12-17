output "vm_id" {
  description = "ID of the virtual machine"
  value       = azurerm_linux_virtual_machine.this.id
}

output "public_ip" {
  description = "Public IP of the virtual machine"
  value       = azurerm_linux_virtual_machine.this.public_ip_address
}

output "network_interface_id" {
  description = "ID of the network interface"
  value       = azurerm_network_interface.example_nic["nic1"].id
}
