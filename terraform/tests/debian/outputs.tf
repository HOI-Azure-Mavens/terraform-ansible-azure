output "vm_name" {
  description = "Name of the deployed VM"
  value       = module.vm.vm_name
}

output "vm_public_ip" {
  description = "Public IP of the deployed VM"
  value       = module.vm.vm_public_ip
}
