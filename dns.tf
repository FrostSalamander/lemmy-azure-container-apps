/*
resource "azurerm_private_dns_zone" "postgres_zone" {
  name                = "lemmy.postgres.database.azure.com"
  resource_group_name = azurerm_resource_group.containerapp_rg.name
}

resource "azurerm_private_dns_zone_virtual_network_link" "postgres_zone_link" {
  name                  = "postgres-link"
  private_dns_zone_name = azurerm_private_dns_zone.postgres_zone.name
  virtual_network_id    = azurerm_virtual_network.containerapp_vnet.id
  resource_group_name   = azurerm_resource_group.containerapp_rg.name
}
*/