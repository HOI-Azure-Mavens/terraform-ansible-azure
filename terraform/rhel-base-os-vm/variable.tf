variable "vm_name" {
  description = "The name of the virtual machine."
  default     = "rhel-base-os-vm"
}

variable "location" {
  description = "The Azure location where resources will be created."
  default     = "northeurope"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  default     = "rhel-base-os-vm-rg"
}

variable "vm_size" {
  description = "The size of the virtual machine."
  default     = "Standard_D2s_v3"
}

variable "admin_username" {
  description = "The admin username for the virtual machine."
  default     = "azureuser"
}

variable "os_offer" {
  description = "The offer of the OS image."
  default     = "rhel"
}

variable "os_sku" {
  description = "The SKU of the OS image."
  default     = "9-lvm-gen2"
}

variable "os_version" {
  description = "The version of the OS image."
  default     = "latest"
}

