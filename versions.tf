terraform {
  required_version = ">= 1.3.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 3.34.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.4.3"
    }
  }

  backend "azurerm" {
    resource_group_name  = "rg-dev"
    storage_account_name = "storagedev19112022"
    container_name       = "tfstate-bc"
    key                  = "infra/terraform.tfstate"
  }
}

provider "azurerm" {
  features {

  }
}