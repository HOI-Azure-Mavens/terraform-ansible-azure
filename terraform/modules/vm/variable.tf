variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "location" {
  description = "Azure region for the virtual machine"
  type        = string
}

variable "resource_group_name" {
  description = "Resource group name for the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
  default     = "Standard_B2s"
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key"
  type        = string
}

variable "os_offer" {
  description = "Operating system offer (e.g., UbuntuServer)"
  type        = string
  default     = "UbuntuServer"
}

variable "os_sku" {
  description = "Operating system SKU (e.g., 22.04-LTS)"
  type        = string
  default     = "22.04-LTS"
}

variable "os_version" {
  description = "Operating system version (e.g., latest)"
  type        = string
  default     = "latest"
}

