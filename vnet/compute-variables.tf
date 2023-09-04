variable "vm_name" {
  default = "myVM"
}

variable "vm_size" {
  default = "Standard_F2"
}

variable "admin_username" {
  default = "devops"
}

variable "pub_file" {
  default = "~/.ssh/id_rsa.pub"
}

variable "nic_name" {
  default = "myNIC"
}

variable "public_ip" {
  default = "myPIP"
}
