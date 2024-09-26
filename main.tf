locals {
  WESTEUROPE = "westeurope"
  tags_common = {
    environment = "training"
    client      = "generali"
  }
}

data "azurerm_resource_group" "root" {
  name = "generali"
}

resource "azurerm_resource_group" "example" {
  name       = "generali-example"
  location   = local.WESTEUROPE
  tags       = local.tags_common
  managed_by = data.azurerm_resource_group.root.id
}
