module "resource-group" {
    source = "../../Child_modules/azurerm_resource_group"
    rg-name = var.rg-name
  
}