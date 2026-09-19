variable "peering_name_1_to_2" {
  type        = string
  description = "Name of the peering from VNet 1 to VNet 2"
}

variable "peering_name_2_to_1" {
  type        = string
  description = "Name of the peering from VNet 2 to VNet 1"
}

variable "vnet_1_rg_name" {
  type        = string
  description = "Resource Group Name of VNet 1"
}

variable "vnet_1_name" {
  type        = string
  description = "Virtual Network Name of VNet 1"
}

variable "vnet_1_id" {
  type        = string
  description = "Resource ID of VNet 1"
}

variable "vnet_2_rg_name" {
  type        = string
  description = "Resource Group Name of VNet 2"
}

variable "vnet_2_name" {
  type        = string
  description = "Virtual Network Name of VNet 2"
}

variable "vnet_2_id" {
  type        = string
  description = "Resource ID of VNet 2"
}
