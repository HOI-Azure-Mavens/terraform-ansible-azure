# Azure Container Instances Module

This module deploys an Azure Container Instance (ACI) in a specified resource group.

## Usage

```hcl
module "aci" {
  source              = "../modules/aci"
  resource_group_name = "test-aci-rg"
  location            = "eastus"
  container_group_name = "test-container-group"
  container_name       = "mycontainer"
  image_name           = "microsoft/aci-helloworld"
  os_type              = "Linux"
  cpu_core_number      = 0.5
  memory_size          = 1.5
  port_number          = 80
  tags                 = { Environment = "Test" }
}
