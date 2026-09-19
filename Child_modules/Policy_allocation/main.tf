# Use Azure Built-in Policy Definition for "Allowed locations" (Avoids needing subscription write permissions)
data "azurerm_policy_definition" "allowed_locations" {
  count        = var.enable_policy_assignment ? 1 : 0
  display_name = "Allowed locations"
}

resource "azurerm_resource_group_policy_assignment" "rg_policy" {
  count                = var.enable_policy_assignment ? 1 : 0
  name                 = var.policy-name
  resource_group_id    = var.scope
  policy_definition_id = data.azurerm_policy_definition.allowed_locations[0].id

  parameters = jsonencode({
    listOfAllowedLocations = {
      value = var.allowed_locations
    }
  })
}
