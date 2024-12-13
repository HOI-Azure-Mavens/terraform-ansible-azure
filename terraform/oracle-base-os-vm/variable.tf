variable "vm_name" {
  default     = "oracle-base-os-vm"
  description = "The name of the Oracle Linux virtual machine."
}

variable "location" {
  default     = "northeurope"
  description = "The location of the resources."
}

variable "resource_group_name" {
  description = "The name of the resource group."
}

variable "vm_size" {
  default     = "Standard_D2s_v3"
  description = "The size of the virtual machine."
}

variable "admin_username" {
  default     = "azureuser"
  description = "The admin username for the Oracle Linux virtual machine."
}

variable "ssh_public_key_path" {
  default     = "~/.ssh/id_rsa.pub"
  description = "The path to the SSH public key."
}

