resource "azurerm_policy_definition" "allowed_locations" {
  name         = "allowed-locations"
  policy_type  = "Custom"
  mode         = "All"
  display_name = "Allowed Locations Policy"
  policy_rule  = <<POLICY
{
  "if": {
    "not": {
      "field": "location",
      "in": "[parameters('allowedLocations')]"
    }
  },
  "then": {
    "effect": "deny"
  }
}
POLICY

  parameters = <<PARAMS
{
  "allowedLocations": {
    "type": "Array",
    "metadata": {
      "description": "Allowed locations",
      "displayName": "Allowed locations"
    }
  }
}
PARAMS
}

resource "azurerm_resource_group_policy_assignment" "rg_policy" {
  name                 = var.policy-name
  resource_group_id    = var.scope
  policy_definition_id = azurerm_policy_definition.allowed_locations.id

  parameters = jsonencode({
    allowedLocations = {
      value = var.allowed_locations
    }
  })
}
