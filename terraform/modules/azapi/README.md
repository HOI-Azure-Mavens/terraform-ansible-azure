# Azure AzAPI Module

This module allows you to create and manage Azure resources using the AzAPI provider. It enables support for resources and features not yet available in the `azurerm` provider.

## Usage

```hcl
module "azapi_custom" {
  source              = "../modules/azapi"
  resource_group_name = "example-rg"
  location            = "East US"
  resource_name       = "myCustomResource"
  resource_type       = "Microsoft.Automation/automationAccounts@2021-06-22"

  resource_body = {
    properties = {
      disableLocalAuth    = true
      publicNetworkAccess = false
      sku = {
        name = "Basic"
      }
    }
  }
}
