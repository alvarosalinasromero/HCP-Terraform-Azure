terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

variable "storage_name" {
  type        = string
}

resource "azurerm_resource_group" "newrsg" {
  name     = "hcpterraform"
  location = "west europe"
}

resource "azurerm_storage_account" "this" {
  name                     = var.storage_name
  resource_group_name      = azurerm_resource_group.newrsg.name
  location                 = azurerm_resource_group.newrsg.location #implicity dependency
  account_tier             = "Standard"
  account_replication_type = "LRS"
}