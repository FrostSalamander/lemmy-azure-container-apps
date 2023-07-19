resource "azurerm_postgresql_flexible_server" "postgres" {
  name                   = var.db_server_name
  resource_group_name    = azurerm_resource_group.containerapp_rg.name
  location               = azurerm_resource_group.containerapp_rg.location
  version                = "15"
  //delegated_subnet_id    = azurerm_subnet.postgres_subnet.id
  //private_dns_zone_id    = azurerm_private_dns_zone.postgres_zone.id
  administrator_login    = var.db_username
  administrator_password = var.db_password
  storage_mb             = 32768
  sku_name               = "B_Standard_B1ms"
  zone                   = "1"

  // Errors if the DNS zone VNet link isn't in place at the time of server deployment
  #depends_on = [azurerm_private_dns_zone_virtual_network_link.postgres_zone_link]
}

resource "azurerm_postgresql_flexible_server_configuration" "postgres_config" {
  name      = "azure.extensions"
  server_id = azurerm_postgresql_flexible_server.postgres.id
  value     = "PGCRYPTO,LTREE"
}

resource "azurerm_postgresql_flexible_server_database" "lemmy_db" {
  name      = "lemmy"
  server_id = azurerm_postgresql_flexible_server.postgres.id
  collation = "en_US.utf8"
  charset   = "utf8"
}

# TODO: make this a list for multiple admins
resource "azurerm_postgresql_flexible_server_firewall_rule" "home" {
  name             = "home"
  server_id        = azurerm_postgresql_flexible_server.postgres.id
  start_ip_address = var.home_ip
  end_ip_address   = var.home_ip
}

# Rule for Container App Environment outbound IP. Not clear if this is actually needed
resource "azurerm_postgresql_flexible_server_firewall_rule" "container_apps" {
  name             = "container-apps"
  server_id        = azurerm_postgresql_flexible_server.postgres.id
  start_ip_address = azurerm_container_app_environment.containerapp_env.static_ip_address
  end_ip_address   = azurerm_container_app_environment.containerapp_env.static_ip_address
}

# Rule for Lemmy backend container app. Definitely needed.
resource "azurerm_postgresql_flexible_server_firewall_rule" "lemmy_app" {
  name             = "lemmy-app"
  server_id        = azurerm_postgresql_flexible_server.postgres.id

  # TODO: outbound_ip_addresses is a list, but this only works for the first
  # item in the list. Can't use for_each as values not known up front.
  start_ip_address = azurerm_container_app.lemmy.outbound_ip_addresses[0]
  end_ip_address   = azurerm_container_app.lemmy.outbound_ip_addresses[0]
}




