module "vm" {
  for_each = var.tools
  source = "./vm-module"
  component = each.key
  ssh_username = var.ssh_username
  ssh_password = var.ssh_password
  port         = each.value["port"]
}

variable "tools" {
  default = {
    vault ={
      port = 8200
    }
  }
}

variable "ssh_username" {}
variable "ssh_password" {}

terraform {
  backend "azurerm" {
    resource_group_name  = "Roboshop-Shell"
    storage_account_name = "azdevopstfstates"
    container_name       = "tools-tf-state"
    key                  = "terraform.tfstate"
  }
}
provider "azurerm" {
  features {}
  subscription_id = "3303fa75-89ef-466f-b4e0-1cfcc504e6d0"
}