terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.4.0"
    }
    azapi = {
      source  = "Azure/azapi"
      version = "=0.1.1"
    }
  }

  required_version = "=1.1.9"
}

provider "azurerm" {
  features {}
}

provider "azapi" {
  # More information on the authentication methods supported by
  # the AzureRM Provider can be found here:
  # https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs

  # subscription_id = "..."
  # client_id       = "..."
  # client_secret   = "..."
  # tenant_id       = "..."
}
