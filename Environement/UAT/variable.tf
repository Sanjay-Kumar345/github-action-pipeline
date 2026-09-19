variable "rg-name" {
  type = map(object({
    name     = string
    location = string
  }))
  description = "Resource Group mapping"
}

variable "policy-name" {
  type        = string
  description = "Policy assignment name"
}

variable "allowed_locations" {
  type        = list(string)
  default     = ["eastus", "australiaeast"]
  description = "List of allowed Azure locations"
}

# VNet 1 Variables (East US)
variable "vnet1_name" {
  type        = string
  description = "Name of VNet 1"
}

variable "vnet1_address_space" {
  type        = list(string)
  description = "Address space for VNet 1"
}

variable "vnet1_vm_subnet_prefix" {
  type        = list(string)
  description = "Subnet prefix for VNet 1 VM"
}

variable "vnet1_bastion_subnet_prefix" {
  type        = list(string)
  description = "Subnet prefix for VNet 1 AzureBastionSubnet"
}

# VNet 2 Variables (Australia East)
variable "vnet2_name" {
  type        = string
  description = "Name of VNet 2"
}

variable "vnet2_address_space" {
  type        = list(string)
  description = "Address space for VNet 2"
}

variable "vnet2_vm_subnet_prefix" {
  type        = list(string)
  description = "Subnet prefix for VNet 2 VM"
}

variable "vnet2_bastion_subnet_prefix" {
  type        = list(string)
  description = "Subnet prefix for VNet 2 AzureBastionSubnet"
}

# VM Variables
variable "vm1_name" {
  type        = string
  description = "Name of VM 1 in East US"
}

variable "vm2_name" {
  type        = string
  description = "Name of VM 2 in Australia East"
}

variable "vm_size" {
  type        = string
  default     = "Standard_B1s"
  description = "Size of the VMs"
}

variable "enable_policy_assignment" {
  type        = bool
  default     = false
  description = "Controls whether to create policy assignments (requires Resource Policy Contributor or Owner role)"
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
  description = "Admin username for VMs"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Admin password for VMs"
}