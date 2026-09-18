variable "rg-name" {
    type = map(object({
      name = string
      location = string
    }))
  
}