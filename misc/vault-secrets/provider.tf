provider "vault" {
  address = "http://vault-internal.azdevops.shop:8200"
  token   = var.token
}

terraform {
  backend "azurerm" {
    resource_group_name  = "Roboshop-Shell"
    storage_account_name = "azdevopstfstates"
    container_name       = "vault-tf-states"
    key                  = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
  subscription_id = "3303fa75-89ef-466f-b4e0-1cfcc504e6d0"
}

variable "token" {}