output "vm_id" {
  description = "The ID of the Virtual Machine"
  value       = module.compute.vm_id
}

output "vm_private_ip" {
  description = "The private IP address of the VM"
  value       = module.compute.vm_private_ip
}

output "vm_public_ip" {
  description = "The public IP address of the VM"
  value       = module.compute.vm_public_ip
}
