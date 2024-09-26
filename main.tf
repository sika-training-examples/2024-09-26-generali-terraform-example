locals {
  WESTEUROPE = "westeurope"
}

resource "azurerm_resource_group" "example" {
  name     = "generali-example"
  location = local.WESTEUROPE
}
