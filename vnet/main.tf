# new resource group
resource "azurerm_resource_group" "myapp01" {
   name = var.rgname
   location = var.rglocation
}

# New virtual network
resource "azurerm_virtual_network" "myvnet" {
    name = var.vnet_name
    resource_group_name = azurerm_resource_group.myapp01.name
    location = azurerm_resource_group.myapp01.location
    address_space = var.vnet_address_space
}

# New public subnet
resource "azurerm_subnet" "public-sub"{
    name=var.pub_subnet_name
    resource_group_name=azurerm_resource_group.myapp01.name
    virtual_network_name = azurerm_virtual_network.myvnet.name
    address_prefixes = var.public_cidr
}

# New private subnet
resource "azurerm_subnet" "private-sub"{
    name=var.priv_subnet_name
    resource_group_name=azurerm_resource_group.myapp01.name
    virtual_network_name = azurerm_virtual_network.myvnet.name
    address_prefixes = var.private_cidr
}

# network security group
resource "azurerm_network_security_group" "mynsg" {
    name                = "${var.nsg}"
    location            = azurerm_resource_group.myapp01.location
    resource_group_name  = azurerm_resource_group.myapp01.name

    security_rule {
        name                       = "http"
        priority                   = 200
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = ["80","443"]
        source_address_prefix      = "*"
        destination_address_prefix ="*"
    }

    security_rule {
        name                       = "ssh"
        priority                   = 110
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "*"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix ="*"
    }

}
