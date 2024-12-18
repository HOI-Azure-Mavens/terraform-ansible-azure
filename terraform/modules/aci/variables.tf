variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "location" {
  description = "The Azure location"
  type        = string
}

variable "container_group_name" {
  description = "The name of the container group"
  type        = string
}

variable "container_name" {
  description = "The name of the container"
  type        = string
}

variable "image_name" {
  description = "The container image to deploy"
  type        = string
}

variable "os_type" {
  description = "The OS type of the container (Linux or Windows)"
  type        = string
}

variable "cpu_core_number" {
  description = "The number of CPU cores for the container"
  type        = number
}

variable "memory_size" {
  description = "The memory size in GB for the container"
  type        = number
}

variable "port_number" {
  description = "The port number for the container"
  type        = number
}

variable "tags" {
  description = "A map of tags to apply to the resources"
  type        = map(string)
  default     = {}
}

variable "registry_server" {
  description = "The container registry server (e.g., index.docker.io or <acr-name>.azurecr.io)"
  type        = string
  default     = null
}

variable "registry_username" {
  description = "The username for the container registry"
  type        = string
  default     = null
}

variable "registry_password" {
  description = "The password for the container registry"
  type        = string
  default     = null
  sensitive   = true
}
