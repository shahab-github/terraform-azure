variable "rgname" {
  default = "myapp01"
}

variable "rglocation" {
  default = "East US"
}

variable "vnet_name" {
  default = "myVent"
}

variable "vnet_address_space" {
  default = "192.168.0.0/16"
}

variable "pub_subnet_name" {
  default = "publicSubnet"
}

variable "public_cidr" {
  default = "192.168.1.0/24"
}

variable "priv_subnet_name" {
  default = "privateSubnet"
}

variable "private_cidr" {
  default = "192.168.10.0/24"
}

variable "nsg" {
  default = "myNSG"
}
