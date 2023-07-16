resource "azurerm_container_app" "nginx" {
  name                         = "nginx"
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
      name   = "nginx"
      image  = var.nginx_image
      cpu    = 0.5
      memory = "1Gi"
    }
  }

  ingress {
    allow_insecure_connections = false
    external_enabled = true
    target_port = 8080

    traffic_weight {
      percentage = 100
      latest_revision = true
    }
  }
}