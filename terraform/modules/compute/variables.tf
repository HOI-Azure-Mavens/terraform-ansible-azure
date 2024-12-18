variable "resource_group_name" {
  description = "Resource group name"
  type        = string
}

variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "network_interfaces" {
  description = "Network interfaces configuration"
  type        = map(any)
}

variable "admin_ssh_key" {
  description = "Public SSH key for admin user"
  type        = string
}

variable "source_image_reference" {
  description = "Source image reference"
  type        = map(string)
}

variable "admin_username" {
  description = "Username for the VM administrator"
  type        = string
  default     = "adminuser"
}


