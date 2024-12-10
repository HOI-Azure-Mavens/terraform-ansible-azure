variable "project_name" {
  description = "Project name for resource naming"
  type        = string
}

variable "location" {
  description = "Azure Region"
  type        = string
  default     = "East US"
}

variable "primary_vm_size" {
  description = "Primary VM size to be used"
  type        = string
  default     = "Standard_D2s_v3"
}

variable "fallback_vm_sizes" {
  description = "List of fallback VM sizes in case the primary is not available"
  type        = list(string)
  default     = ["Standard_D2s_v4", "Standard_D2s_v5", "Standard_B2s"]
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

variable "subscription_id" {
  description = "The subscription ID for the Azure account."
  type        = string
  default     = null
}

variable "locations" {
  description = "List of Azure regions"
  type        = list(string)
}

