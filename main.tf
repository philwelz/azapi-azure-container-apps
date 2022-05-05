################################
############# Locals ###########
################################

# define locals that will not change accross environments
locals {
  # Common tags to be assigned to all resources
  common_tags = {
    env       = "demo"
    managedBy = data.azurerm_client_config.current.client_id
    project   = var.prefix

  }
}

################################
###### Fetch Information #######
################################

# get current subscription
data "azurerm_subscription" "current" {
}

# get current client
data "azurerm_client_config" "current" {
}

################################
###### Resource Group #########
################################

resource "azurerm_resource_group" "rg_aca" {
  name     = "rg-${var.prefix}"
  location = "West Europe"
  tags     = local.common_tags
}
