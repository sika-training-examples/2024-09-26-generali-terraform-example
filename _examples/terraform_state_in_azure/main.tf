locals {
  WESTEUROPE = "westeurope"
}

resource "azurerm_resource_group" "example" {
  name     = "generali-azure-state-example"
  location = local.WESTEUROPE
}
