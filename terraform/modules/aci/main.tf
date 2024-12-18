resource "azurerm_container_group" "aci" {
  name                = var.container_group_name
  location            = var.location            # Use variable for location
  resource_group_name = var.resource_group_name # Use variable for RG

  container {
    name   = var.container_name
    image  = var.image_name # Make image configurable via variable
    cpu    = var.cpu_core_number
    memory = var.memory_size

    ports {
      port     = var.port_number
      protocol = "TCP"
    }
  }

  os_type = var.os_type

  # Add this block for image registry credentials if using a private registry
  image_registry_credential {
    server   = var.registry_server   # Registry URL
    username = var.registry_username # Username for authentication
    password = var.registry_password # Password for authentication
  }
}



