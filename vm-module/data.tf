data "azurerm_resource_group" "main" {
  name = "Roboshop-Shell"
}

data "azurerm_subnet" "main" {
  name                 = "default"
  virtual_network_name = "Roboshop-shellVN"
  resource_group_name  = data.azurerm_resource_group.main.name
}