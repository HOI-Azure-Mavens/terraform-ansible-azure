# Azure Compute Module (AVM-Based)

This Terraform module deploys Azure Virtual Machines using the [AVM (Azure Verified Modules)](https://github.com/Azure/terraform-azurerm-avm-res-compute-virtualmachine) library. It supports both Linux and Windows Virtual Machines.

---

## Features

- Deploys Azure VMs with best practices using AVM standards.
- Supports:
  - Linux and Windows Virtual Machines.
  - Networking configuration (NICs, Public IPs, NSGs).
  - Disk management.
  - Diagnostic settings and telemetry.
  - Managed Identity and Role Assignments.
- Aligns with semantic versioning and best practices.

---

## Requirements

| Name       | Version      |
|------------|--------------|
| Terraform  | >= 1.6       |
| AzureRM    | >= 3.116, < 5.0  |
| Random     | ~> 3.6       |
| TLS        | ~> 4.0       |

---

## Usage

Below is an example of how to use this Compute module:

```hcl
module "compute" {
  source  = "../modules/compute"

  # Required Inputs
  name                = "example-vm"
  location            = "eastus"
  resource_group_name = "example-rg"
  zone                = "1"

  network_interfaces = {
    nic1 = {
      name = "example-nic"
      ip_configurations = {
        ipconfig1 = {
          name                          = "example-ipconfig"
          private_ip_subnet_resource_id = azurerm_subnet.example.id
          create_public_ip_address      = true
        }
      }
    }
  }

  admin_username  = "azureuser"
  admin_password  = "<replace-with-secure-password>"

  # Optional
  data_disk_managed_disks = {
    disk1 = {
      name                 = "example-disk1"
      storage_account_type = "Standard_LRS"
      lun                  = 0
      caching              = "ReadWrite"
      disk_size_gb         = 32
    }
  }

  tags = {
    Environment = "Dev"
    Project     = "AVM-Compute-Deployment"
  }
}

