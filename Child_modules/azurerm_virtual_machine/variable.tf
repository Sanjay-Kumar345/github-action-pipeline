variable "vm_name" {
  type        = string
  description = "Name of the Virtual Machine"
}

variable "location" {
  type        = string
  description = "Azure region for VM"
}

variable "resource_group_name" {
  type        = string
  description = "Resource Group Name for VM"
}

variable "subnet_id" {
  type        = string
  description = "Subnet ID to attach the VM NIC to"
}

variable "vm_size" {
  type        = string
  default     = "Standard_D2s_v3"
  description = "Size of the VM"
}

variable "admin_username" {
  type        = string
  default     = "azureuser"
  description = "Admin username"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "Admin password"
}
