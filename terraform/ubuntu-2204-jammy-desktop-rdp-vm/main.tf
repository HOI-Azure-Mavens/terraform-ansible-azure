terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.74.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}

locals {
  all_vm_sizes = concat([var.primary_vm_size], var.fallback_vm_sizes)
  vm_size = coalesce(
    try(var.primary_vm_size, null),
    try(var.fallback_vm_sizes[0], null),
    try(var.fallback_vm_sizes[1], null),
    try(var.fallback_vm_sizes[2], null),
    "Standard_B2s"
  )
  selected_location = element(var.locations, 0)
}

resource "azurerm_resource_group" "vm_rg" {
  name     = "${var.project_name}-rg"
  location = local.selected_location

  tags = {
    environment = "Development"
    managed_by  = "terraform"
  }
}

resource "azurerm_virtual_network" "vm_vnet" {
  name                = "${var.project_name}-vnet"
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = "Development"
    managed_by  = "terraform"
  }
}

resource "azurerm_subnet" "vm_subnet" {
  name                 = "${var.project_name}-subnet"
  resource_group_name  = azurerm_resource_group.vm_rg.name
  virtual_network_name = azurerm_virtual_network.vm_vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

resource "azurerm_public_ip" "vm_pip" {
  name                = "${var.project_name}-pip"
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = {
    environment = "Development"
    managed_by  = "terraform"
  }
}

resource "azurerm_network_interface" "vm_nic" {
  name                = "${var.project_name}-nic"
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.vm_subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.vm_pip.id
  }

  tags = {
    environment = "Development"
    managed_by  = "terraform"
  }
}

resource "azurerm_network_security_group" "vm_nsg" {
  name                = "${var.project_name}-nsg"
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name

  security_rule {
    name                       = "SSH"
    priority                   = 1001
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Development"
    managed_by  = "terraform"
  }
}

resource "azurerm_network_interface_security_group_association" "vm_nic_nsg" {
  network_interface_id      = azurerm_network_interface.vm_nic.id
  network_security_group_id = azurerm_network_security_group.vm_nsg.id
}

resource "azurerm_linux_virtual_machine" "vm" {
  name                = "${var.project_name}-vm"
  location            = azurerm_resource_group.vm_rg.location
  resource_group_name = azurerm_resource_group.vm_rg.name
  size                = local.vm_size
  admin_username      = var.admin_username

  network_interface_ids = [
    azurerm_network_interface.vm_nic.id
  ]

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  admin_ssh_key {
    username   = var.admin_username
    public_key = file(var.ssh_public_key_path)
  }

  tags = {
    environment = "Development"
    managed_by  = "terraform"
  }
}
