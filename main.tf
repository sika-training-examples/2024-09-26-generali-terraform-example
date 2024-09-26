locals {
  WESTEUROPE = "westeurope"
  tags_common = {
    environment = "training"
    client      = "generali"
  }
}

resource "azurerm_resource_group" "example" {
  name     = "generali-example"
  location = local.WESTEUROPE
  tags     = local.tags_common
}
