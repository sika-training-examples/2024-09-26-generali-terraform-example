locals {
  aks_name               = "generali-aks-example"
  aks_location           = "northeurope"
  aks_kubernetes_version = "1.28"
  aks_vm_size            = "Standard_B2s"
  aks_node_count         = 1
}

resource "azurerm_resource_group" "aks-example" {
  name     = local.aks_name
  location = local.aks_location
}


resource "azurerm_kubernetes_cluster" "example" {
  name                              = local.aks_name
  location                          = azurerm_resource_group.aks-example.location
  resource_group_name               = azurerm_resource_group.aks-example.name
  dns_prefix                        = local.aks_name
  kubernetes_version                = local.aks_kubernetes_version
  role_based_access_control_enabled = true

  default_node_pool {
    name       = substr(replace(local.aks_name, "-", ""), 0, 12)
    node_count = local.aks_node_count
    vm_size    = local.aks_vm_size
  }

  identity {
    type = "SystemAssigned"
  }

  network_profile {
    network_plugin    = "azure"
    service_cidr      = "10.43.0.0/16"
    dns_service_ip    = "10.43.0.10"
    load_balancer_sku = "standard"
  }
}
