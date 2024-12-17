# Azure Container Apps Module

This Terraform module creates Azure Container Apps along with a Log Analytics Workspace and Container App Environment.

## Usage

```hcl
module "container_apps" {
  source = "../modules/container-apps"

  resource_group_name            = "test-container-apps-rg"
  location                       = "eastus"
  container_app_environment_name = "test-container-env"

  container_apps = {
    my-container-app = {
      name = "test-container-app"
      tags = {
        environment = "test"
      }
      template = {
        containers = [
          {
            name   = "test-container"
            image  = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
            cpu    = "0.5"
            memory = "1Gi"
            env = {
              "ENVIRONMENT" = "test"
            }
          }
        ]
        min_replicas = 1
        max_replicas = 3
      }
      ingress = {
        target_port      = 80
        external_enabled = true
      }
    }
  }
}

