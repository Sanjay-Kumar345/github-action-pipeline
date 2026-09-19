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