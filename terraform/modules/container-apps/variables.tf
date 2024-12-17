variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The Azure region to deploy resources."
  type        = string
}

variable "container_app_environment_name" {
  description = "The name of the Container App Environment."
  type        = string
}

variable "container_apps" {
  description = "The configuration for container apps."
  type = map(object({
    name         = string
    revision_mode = string

    tags         = optional(map(string))

    template = object({
      containers = list(object({
        name    = string
        image   = string
        cpu     = string
        memory  = string
        env     = optional(list(object({
          name  = string
          value = string
        })))
      }))
      min_replicas = optional(number)
      max_replicas = optional(number)
    })

    ingress = object({
      target_port      = number
      external_enabled = bool
    })
  }))
}




