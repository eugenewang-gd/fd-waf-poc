terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }

  backend "azurerm" {
    resource_group_name  = "shengchang-test"
    storage_account_name = "shengchangpoctest"
    container_name       = "waf-poc"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}