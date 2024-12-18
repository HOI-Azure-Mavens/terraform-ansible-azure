variable "vm_name" {
  description = "Name of the Virtual Machine"
  type        = string
}

variable "location" {
  description = "Azure region where resources will be created"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the Resource Group"
  type        = string
}

variable "vm_size" {
  description = "Size of the Virtual Machine"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "Admin username for the Virtual Machine"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
}

variable "os_offer" {
  description = "OS offer for the Virtual Machine"
  type        = string
}

variable "os_sku" {
  description = "OS SKU for the Virtual Machine"
  type        = string
}

variable "os_version" {
  description = "OS version for the Virtual Machine"
  type        = string
}


