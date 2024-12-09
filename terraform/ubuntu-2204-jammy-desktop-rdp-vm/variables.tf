variable "project_name" {
  description = "Project name used for resource naming conventions"
  type        = string
  default     = "ubuntu-2204-jammy-desktop-rdp-vm"
}

variable "location" {
  description = "Azure Region for resource deployment"
  type        = string
  default     = "East US" # You can change this based on your preferred region
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "adminuser"
}

variable "ssh_public_key_path" {
  description = "Path to the SSH public key for VM access"
  type        = string
  default     = "~/.ssh/id_rsa.pub" # Ensure this file exists before deployment
}

# Optional variables for advanced customization
variable "vnet_address_space" {
  description = "Address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_address_prefix" {
  description = "Address prefix for the subnet"
  type        = list(string)
  default     = ["10.0.1.0/24"]
}
