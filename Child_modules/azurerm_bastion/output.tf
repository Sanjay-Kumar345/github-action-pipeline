output "bastion_id" {
  value       = azurerm_bastion_host.bastion.id
  description = "ID of Azure Bastion host"
}

output "bastion_dns_name" {
  value       = azurerm_bastion_host.bastion.dns_name
  description = "DNS name of Azure Bastion host"
}
