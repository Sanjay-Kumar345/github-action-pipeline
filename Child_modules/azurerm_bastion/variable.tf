variable "bastion_name" {
  type        = string
  description = "Name of the Azure Bastion host"
}

variable "location" {
  type        = string
  description = "Azure location"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name"
}

variable "bastion_subnet_id" {
  type        = string
  description = "Resource ID of the AzureBastionSubnet"
}

variable "public_ip_name" {
  type        = string
  description = "Name of the Public IP for Bastion"
}
