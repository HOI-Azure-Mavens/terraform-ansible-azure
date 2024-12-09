variable "resource_group_name" {
  description = "Base name for the Resource Group"
  type        = string
  default     = "debian-vm-rg"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "East US"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "adminuser"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B2ms"
}

variable "storage_prefix" {
  description = "Prefix for the storage account name"
  type        = string
  default     = "stgansiter"
}


