variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
}

variable "os_version" {
  description = "OS version for the VM"
  type        = string
}

variable "location" {
  description = "Azure region where the resources will be deployed"
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for the resources"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "os_offer" {
  description = "OS offer for the VM"
  type        = string
}

variable "os_sku" {
  description = "OS SKU for the VM"
  type        = string
}




