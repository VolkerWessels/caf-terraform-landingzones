
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      #version = "~> 2.96"
      version = ">= 3.54" # upped the version to allow v4.0.1+ caf_eslz support
    }
  }
  required_version = ">= 1.3.5"
  # experiments      = [module_variable_optional_attrs]
}


provider "azurerm" {
  partner_id = "ca4078f8-9bc4-471b-ab5b-3af6b86a42c8"
  # partner identifier for CAF Terraform landing zones.
  features {}
}

data "azurerm_client_config" "current" {}
