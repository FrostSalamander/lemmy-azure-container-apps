resource "azurerm_container_app" "caddy" {
  name                         = "caddy"
  container_app_environment_id = azurerm_container_app_environment.containerapp_env.id
  resource_group_name          = azurerm_resource_group.containerapp_rg.name
  revision_mode                = "Single"

  identity {
    type = "SystemAssigned"
  }

  template {

    min_replicas = 1
    max_replicas = 1

    container {
      name   = "caddy"
      image  = var.caddy_image
      cpu    = 0.5
      memory = "1Gi"
    }
  }

  ingress {
    allow_insecure_connections = true
    external_enabled = true
    target_port = 80

    traffic_weight {
      percentage = 100
      latest_revision = true
    }
  }
}