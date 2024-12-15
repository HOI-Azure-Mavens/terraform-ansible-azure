variable "vm_name" {
  description = "The name of the virtual machine."
  default     = "win-server-2022-datacenter-base-os-vm"
}

variable "location" {
  description = "The Azure location where resources will be created."
  default     = "northeurope"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  default     = "win-server-2022-datacenter-base-os-vm-rg"
}

variable "vm_size" {
  description = "The size of the virtual machine."
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "The admin username for the virtual machine."
  default     = "adminuser"
}

variable "admin_password" {
  description = "The administrator password for the Windows VM"
  sensitive   = true
}


