# Log Analytics Workspace for Container Apps Environment
resource "azurerm_log_analytics_workspace" "laws" {
  name                = "${var.container_app_environment_name}-logs"
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

# Container App Environment
resource "azurerm_container_app_environment" "container_env" {
  name                       = var.container_app_environment_name
  location                   = var.location
  resource_group_name        = var.resource_group_name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.laws.id
}

# Container Apps
resource "azurerm_container_app" "container_app" {
  for_each = var.container_apps

  name                         = each.value.name
  container_app_environment_id = azurerm_container_app_environment.container_env.id
  resource_group_name          = var.resource_group_name
  revision_mode                = each.value.revision_mode # REQUIRED

  tags = lookup(each.value, "tags", {})

  template {
    min_replicas = lookup(each.value.template, "min_replicas", 1)
    max_replicas = lookup(each.value.template, "max_replicas", 3)

    dynamic "container" {
      for_each = each.value.template.containers
      content {
        name   = container.value.name
        image  = container.value.image
        cpu    = container.value.cpu
        memory = container.value.memory

        dynamic "env" {
          for_each = lookup(container.value, "env", [])
          content {
            name  = env.value.name
            value = env.value.value
          }
        }
      }
    }
  }

  ingress {
    external_enabled = each.value.ingress.external_enabled
    target_port      = each.value.ingress.target_port

    traffic_weight {
      percentage      = 100
      latest_revision = true
    }
  }
}




