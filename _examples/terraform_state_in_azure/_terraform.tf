terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.3.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "generali-example"
    storage_account_name = "generaliexampletraining"
    container_name       = "terraform-states"
    key                  = "terraform_state_in_azure.terraform.tfstate"
  }
}

variable "subscription_id" {}

provider "azurerm" {
  features {}
  subscription_id = var.subscription_id
}
