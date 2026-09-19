# 1. Resource Groups Module
module "resource-group" {
  source  = "../../Child_modules/azurerm_resource_group"
  rg-name = var.rg-name
}

# 2. Azure Policy Allocation Module (Uses Azure Built-in "Allowed locations" policy)
module "policy-resource" {
  source            = "../../Child_modules/Policy_allocation"
  policy-name       = var.policy-name
  allowed_locations = var.allowed_locations
  scope             = module.resource-group.rgs["eastus"].id
  depends_on        = [module.resource-group]
}

# 3. Virtual Network 1 (East US)
module "vnet-eastus" {
  source                        = "../../Child_modules/azurerm_virtual_network"
  vnet_name                     = var.vnet1_name
  location                      = var.rg-name["eastus"].location
  resource_group_name           = var.rg-name["eastus"].name
  address_space                 = var.vnet1_address_space
  vm_subnet_address_prefix      = var.vnet1_vm_subnet_prefix
  bastion_subnet_address_prefix = var.vnet1_bastion_subnet_prefix
  depends_on                    = [module.resource-group]
}

# 4. Virtual Network 2 (Australia East)
module "vnet-australiaeast" {
  source                        = "../../Child_modules/azurerm_virtual_network"
  vnet_name                     = var.vnet2_name
  location                      = var.rg-name["australiaeast"].location
  resource_group_name           = var.rg-name["australiaeast"].name
  address_space                 = var.vnet2_address_space
  vm_subnet_address_prefix      = var.vnet2_vm_subnet_prefix
  bastion_subnet_address_prefix = var.vnet2_bastion_subnet_prefix
  depends_on                    = [module.resource-group]
}

# 5. VNet Peering between East US VNet & Australia East VNet
module "vnet-peering" {
  source              = "../../Child_modules/azurerm_vnet_peering"
  peering_name_1_to_2 = "peering-eastus-to-australiaeast"
  peering_name_2_to_1 = "peering-australiaeast-to-eastus"
  vnet_1_rg_name      = var.rg-name["eastus"].name
  vnet_1_name         = module.vnet-eastus.vnet_name
  vnet_1_id           = module.vnet-eastus.vnet_id
  vnet_2_rg_name      = var.rg-name["australiaeast"].name
  vnet_2_name         = module.vnet-australiaeast.vnet_name
  vnet_2_id           = module.vnet-australiaeast.vnet_id
  depends_on          = [module.vnet-eastus, module.vnet-australiaeast]
}

# 6. Azure Bastion 1 (East US VNet)
module "bastion-eastus" {
  source              = "../../Child_modules/azurerm_bastion"
  bastion_name        = "bastion-eastus"
  location            = var.rg-name["eastus"].location
  resource_group_name = var.rg-name["eastus"].name
  bastion_subnet_id   = module.vnet-eastus.bastion_subnet_id
  public_ip_name      = "pip-bastion-eastus"
  depends_on          = [module.vnet-eastus]
}

# 7. Azure Bastion 2 (Australia East VNet)
module "bastion-australiaeast" {
  source              = "../../Child_modules/azurerm_bastion"
  bastion_name        = "bastion-australiaeast"
  location            = var.rg-name["australiaeast"].location
  resource_group_name = var.rg-name["australiaeast"].name
  bastion_subnet_id   = module.vnet-australiaeast.bastion_subnet_id
  public_ip_name      = "pip-bastion-australiaeast"
  depends_on          = [module.vnet-australiaeast]
}

# 8. Virtual Machine 1 (East US VNet)
module "vm-eastus" {
  source              = "../../Child_modules/azurerm_virtual_machine"
  vm_name             = var.vm1_name
  location            = var.rg-name["eastus"].location
  resource_group_name = var.rg-name["eastus"].name
  subnet_id           = module.vnet-eastus.vm_subnet_id
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  depends_on          = [module.vnet-eastus]
}

# 9. Virtual Machine 2 (Australia East VNet)
module "vm-australiaeast" {
  source              = "../../Child_modules/azurerm_virtual_machine"
  vm_name             = var.vm2_name
  location            = var.rg-name["australiaeast"].location
  resource_group_name = var.rg-name["australiaeast"].name
  subnet_id           = module.vnet-australiaeast.vm_subnet_id
  vm_size             = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  depends_on          = [module.vnet-australiaeast]
}