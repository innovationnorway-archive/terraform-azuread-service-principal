terraform {
  required_version = ">= 0.13.0"
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
      version = ">= 1.2.2"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.4.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 2.2.0"
    }
    time = {
      source  = "hashicorp/time"
      version = ">= 0.4.0"
    }
  }
}
