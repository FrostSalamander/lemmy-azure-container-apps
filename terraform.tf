terraform {

  cloud {
    organization = "fstfctest"

    workspaces {
      name = "lemmy-azure-container-apps"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.65.0"
    }
  }

  required_version = ">= 1.5.2"
}

provider "azurerm" {
  features {}
}