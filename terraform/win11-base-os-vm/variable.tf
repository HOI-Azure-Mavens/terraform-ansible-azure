variable "vm_name" {
  description = "The name of the virtual machine."
  default     = "win11-base-os-vm"
}

variable "location" {
  description = "The Azure location where resources will be created."
  default     = "northeurope"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  default     = "win11-base-os-vm-rg"
}

variable "vm_size" {
  description = "The size of the virtual machine."
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "The admin username for the Windows VM."
  default     = "azureuser"
}

variable "admin_password" {
  description = "The admin password for the Windows VM."
  default     = "ComplexPassword123!"
  sensitive   = true
}
