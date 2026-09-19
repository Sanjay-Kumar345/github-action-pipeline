output "vm_id" {
  value       = azurerm_linux_virtual_machine.vm.id
  description = "ID of the Virtual Machine"
}

output "private_ip_address" {
  value       = azurerm_network_interface.nic.private_ip_address
  description = "Private IP address of the Virtual Machine"
}
