terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.66.0"
    }
  }
}

provider "azurerm" {
    features {}
    subscription_id = "515776c8-b3a8-4862-9224-9442d9a6ebb9"
}