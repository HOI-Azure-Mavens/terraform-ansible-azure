resource "azurerm_network_interface" "example_nic" {
  for_each            = var.network_interfaces
  name                = each.value.name
  location            = var.location
  resource_group_name = var.resource_group_name
  
  ip_configuration {
    name                          = each.value.ip_configurations.ipconfig1.name
    subnet_id                     = each.value.ip_configurations.ipconfig1.private_ip_subnet_resource_id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = try(each.value.ip_configurations.ipconfig1.public_ip_address_id, null)
  }

  depends_on = [
    var.network_interfaces
  ]
}

resource "azurerm_linux_virtual_machine" "this" {
  name                            = var.vm_name
  location                        = var.location
  resource_group_name             = var.resource_group_name
  size                            = var.size
  admin_username                  = var.admin_username
  disable_password_authentication = true
  network_interface_ids           = [azurerm_network_interface.example_nic["nic1"].id]
  
  admin_ssh_key {
    username   = var.admin_username
    public_key = var.admin_ssh_key
  }
  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }
}











