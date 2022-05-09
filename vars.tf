# project prefix
variable "prefix" {
  description = "Name for the resource prefix."
  type        = string
  default     = "azuremeetup"
}

# project stage
variable "stage" {
  description = "Name for the stage."
  type        = string
  default     = "demo"
}

# container image
variable "container_image" {
  description = "Container image"
  type        = string
  default     = "ghcr.io/whiteducksoftware/sample-mvc:fred"
}