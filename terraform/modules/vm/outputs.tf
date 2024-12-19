output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "public_ip" {  # Changed from vm_public_ip
  value = azurerm_public_ip.vm_pip.ip_address
}

output "ssh_connection" {
  value = "ssh ${var.admin_username}@${azurerm_public_ip.vm_pip.ip_address}"
}

output "ssh_private_key" {
  value     = tls_private_key.ssh_key.private_key_pem
  sensitive = true
}





