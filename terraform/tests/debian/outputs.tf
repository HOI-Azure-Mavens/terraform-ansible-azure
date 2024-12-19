output "vm_name" {
  description = "The name of the virtual machine"
  value       = module.vm.vm_name
}

output "vm_public_ip" {
  description = "The public IP address of the virtual machine"
  value       = module.vm.public_ip
}

output "ssh_connection" {
  description = "SSH connection string"
  value       = module.vm.ssh_connection
}

output "ssh_private_key" {
  description = "Private key for SSH connection"
  value       = module.vm.ssh_private_key
  sensitive   = true
}
