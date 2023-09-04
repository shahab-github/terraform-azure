# New Linux virtual machine
resource "azurerm_linux_virtual_machine" "myVM" {
  name = var.vm_name
  resource_group_name = azurerm_resource_group.myapp01.name
  location = azurerm_resource_group.myapp01.location
  size = var.vm_size
  admin_username = var.admin_username
  network_interface_ids = []

  admin_ssh_key {
    username   =  var.admin_username
    public_key = file(var.pub_file)
  }

  os_disk {
    storage_account_type = "StandardSSD_LRS"
    caching              = "ReadWrite"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku = "20_04-lts"
    version = "latest"
  }

}

# Network Interface
resource "azurerm_network_interface" "myNIC" {
  name = var.nic_name
  resource_group_name = azurerm_resource_group.myapp01.name
  location = azurerm_resource_group.myapp01.location

  ip_configuration {
    name = "internal"
    subnet_id=azurerm_subnet.public-subnet.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = azurerm_public_ip.myPublicIP.id
  }
}

# new public ip
resource "azurerm_public_ip" "myPublicIP" {
    name = var.public_ip
    resource_group_name = azurerm_resource_group.myapp01.name
    location = azurerm_resource_group.myapp01.location
    allocation_method = "Static"
}
