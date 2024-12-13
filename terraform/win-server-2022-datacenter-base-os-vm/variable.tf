variable "vm_name" {}
variable "location" {}
variable "resource_group_name" {}
variable "vm_size" {}
variable "admin_username" {}
variable "admin_password" {
  description = "The administrator password for the Windows VM"
  sensitive   = true
}


