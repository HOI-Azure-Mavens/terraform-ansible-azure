module "compute" {
  source  = "Azure/avm-res-compute-virtualmachine/azurerm"
  version = "4.0.0" # Always check for the latest version

  # Required variables
  name                = var.vm_name
  location            = var.location
  resource_group_name = var.resource_group_name
  zone                = var.zone

  network_interfaces = {
    primary_nic = {
      name = var.nic_name
      ip_configurations = {
        primary_ipconfig = {
          name                          = "primary"
          private_ip_subnet_resource_id = var.subnet_id
          create_public_ip_address      = true
        }
      }
    }
  }

  admin_username        = var.admin_username
  admin_ssh_keys        = [{ public_key = var.ssh_public_key, username = var.admin_username }]
  disable_password_authentication = true
  vm_size               = var.vm_size

  tags = var.tags
}
