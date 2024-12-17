variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
}

variable "location" {
  description = "The location of the Azure resources."
  type        = string
}

variable "container_app_environment_name" {
  description = "The name of the Container App Environment."
  type        = string
}

variable "container_apps" {
  description = "A map of container apps to deploy."
  type = map(object({
    name          = string
    revision_mode = string

    template = object({
      min_replicas = number
      max_replicas = number
      containers = list(object({
        name   = string
        image  = string
        cpu    = number
        memory = string
        env = optional(list(object({
          name  = string
          value = string
        })), [])
      }))
    })

    ingress = object({
      external_enabled = bool
      target_port      = number
    })

    tags = optional(map(string), {})
  }))
}





