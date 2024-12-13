provider "azurerm" {
  features {}
  subscription_id = "1001490f-c77c-403e-be9e-97eac578d1d6"
}

resource "azurerm_resource_group" "vm_rg" {
  name     = "${var.vm_name}-rg"
  location = var.location
}

resource "azurerm_windows_virtual_machine" "vm" {
  name                = var.vm_name
  location            = var.location
  resource_group_name = azurerm_resource_group.vm_rg.name
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  computer_name       = substr(var.vm_name, 0, 15) # Ensures name is <= 15 characters

  network_interface_ids = [azurerm_network_interface.vm_nic.id]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2022-Datacenter"
    version   = "latest"
  }
}

resource "azurerm_public_ip" "vm_pip" {
  name                = "${var.vm_name}-pip"
  location            = var.location
  resource_group_name = azurerm_resource_group.vm_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.vm_name}-nic"
  location            = var.location
  resource_group_name = azurerm_resource_group.vm_rg.name
  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_pip.id
  }
}

resource "azurerm_subnet" "vm_subnet" {
  name                 = "${var.vm_name}-subnet"
  resource_group_name  = azurerm_resource_group.vm_rg.name
  virtual_network_name = azurerm_virtual_network.vm_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_virtual_network" "vm_vnet" {
  name                = "${var.vm_name}-vnet"
  location            = var.location
  resource_group_name = azurerm_resource_group.vm_rg.name
  address_space       = ["10.0.0.0/16"]
}




