variable "vm_name" {
  description = "The name of the Virtual Machine"
  type        = string
}

variable "location" {
  description = "The Azure region"
  type        = string
}

variable "resource_group_name" {
  description = "The Resource Group where the VM will be deployed"
  type        = string
}

variable "zone" {
  description = "The availability zone to deploy the VM"
  type        = string
}

variable "nic_name" {
  description = "The name of the Network Interface"
  type        = string
}

variable "subnet_id" {
  description = "The subnet resource ID"
  type        = string
}

variable "vm_size" {
  description = "The size of the Virtual Machine"
  type        = string
  default     = "Standard_DS1_v2"
}

variable "admin_username" {
  description = "Admin username for the VM"
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key" {
  description = "SSH public key for VM access"
  type        = string
}

variable "tags" {
  description = "Tags to apply to the VM"
  type        = map(string)
  default     = {}
}
