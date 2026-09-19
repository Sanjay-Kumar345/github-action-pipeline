output "vnet_id" {
  value       = azurerm_virtual_network.vnet.id
  description = "ID of the Virtual Network"
}

output "vnet_name" {
  value       = azurerm_virtual_network.vnet.name
  description = "Name of the Virtual Network"
}

output "vm_subnet_id" {
  value       = azurerm_subnet.vm_subnet.id
  description = "ID of the VM Subnet"
}

output "bastion_subnet_id" {
  value       = azurerm_subnet.bastion_subnet.id
  description = "ID of the AzureBastionSubnet"
}
