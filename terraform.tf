terraform {

  cloud {
    organization = "fstfctest"

    workspaces {
      name = "tf-cloud-azure"
    }
  }

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.64.0"
    }
  }

  required_version = ">= 1.5.2"
}

provider "azurerm" {
  features {}
}