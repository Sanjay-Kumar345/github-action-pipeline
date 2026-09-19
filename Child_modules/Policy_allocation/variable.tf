variable "policy-name" {
  type        = string
  description = "Name of the policy assignment"
}

variable "scope" {
  type        = string
  description = "Scope of the policy assignment"
}

variable "allowed_locations" {
  type        = list(string)
  default     = ["eastus", "australiaeast"]
  description = "List of allowed Azure locations"
}

variable "enable_policy_assignment" {
  type        = bool
  default     = false
  description = "Flag to enable/disable policy assignment. Set to true only if Service Principal has Resource Policy Contributor or Owner role."
}