variable "vnet_name" {
  type        = string
  description = "Name of the Virtual Network"
}

variable "location" {
  type        = string
  description = "Azure region for the VNet"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name for the VNet"
}

variable "address_space" {
  type        = list(string)
  description = "Address space for the VNet"
}

variable "vm_subnet_name" {
  type        = string
  default     = "vm-subnet"
  description = "Name of the subnet hosting Virtual Machines"
}

variable "vm_subnet_address_prefix" {
  type        = list(string)
  description = "Address prefix for the VM subnet"
}

variable "bastion_subnet_address_prefix" {
  type        = list(string)
  description = "Address prefix for AzureBastionSubnet"
}
