/*
resource "azurerm_virtual_network" "containerapp_vnet" {
  name                = "containerapp-vnet"
  location            = azurerm_resource_group.containerapp_rg.location
  resource_group_name = azurerm_resource_group.containerapp_rg.name
  address_space       = ["10.0.0.0/22"]
}

resource "azurerm_subnet" "containerapp_subnet" {
  name                 = "containerapp-sn"
  resource_group_name  = azurerm_resource_group.containerapp_rg.name
  virtual_network_name = azurerm_virtual_network.containerapp_vnet.name
  address_prefixes     = ["10.0.0.0/23"]
}

resource "azurerm_subnet" "postgres_subnet" {
  name                 = "postgres-sn"
  resource_group_name  = azurerm_resource_group.containerapp_rg.name
  virtual_network_name = azurerm_virtual_network.containerapp_vnet.name
  address_prefixes     = ["10.0.2.0/24"]
  service_endpoints    = ["Microsoft.Storage"]

  delegation {
    name = "fs"
    service_delegation {
    name = "Microsoft.DBforPostgreSQL/flexibleServers"
    actions = [
      "Microsoft.Network/virtualNetworks/subnets/join/action",
      ]
    }
  }
}
*/