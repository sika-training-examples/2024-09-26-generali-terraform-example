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

resource "azurerm_storage_account" "example" {
  name                     = "generaliexampletraining"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "example" {
  name                  = "example"
  storage_account_name  = azurerm_storage_account.example.name
  container_access_type = "private"
}

output "storage_account_name" {
  value = azurerm_storage_account.example.name
}

output "container_name" {
  value = azurerm_storage_container.example.name
}

output "primary_access_key" {
  value     = azurerm_storage_account.example.primary_access_key
  sensitive = true
}
