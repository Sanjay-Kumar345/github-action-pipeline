rg-name = {
  eastus = {
    name     = "rg-eastus-uat"
    location = "East US"
  }
  australiaeast = {
    name     = "rg-australiaeast-uat"
    location = "Australia East"
  }
}

policy-name       = "allowed-locations-policy"
allowed_locations = ["eastus", "australiaeast"]

# VNet 1 (East US)
vnet1_name                  = "vnet-eastus"
vnet1_address_space         = ["10.1.0.0/16"]
vnet1_vm_subnet_prefix      = ["10.1.1.0/24"]
vnet1_bastion_subnet_prefix = ["10.1.2.0/26"]

# VNet 2 (Australia East)
vnet2_name                  = "vnet-australiaeast"
vnet2_address_space         = ["10.2.0.0/16"]
vnet2_vm_subnet_prefix      = ["10.2.1.0/24"]
vnet2_bastion_subnet_prefix = ["10.2.2.0/26"]

# VM Configuration
vm1_name       = "vm-eastus"
vm2_name       = "vm-australiaeast"
admin_username = "azureuser"
admin_password = "P@ssw0rd123456!"