resource "azurerm_container_app" "lemmy_ui" {
  name                         = "lemmy-ui"
  container_app_environment_id = azurerm_container_app_environment.containerapp_env.id
  resource_group_name          = azurerm_resource_group.containerapp_rg.name
  revision_mode                = "Single"

  template {

    min_replicas = 1
    max_replicas = 1

    container {
      name   = "lemmy-ui"
      image  = var.lemmy_ui_image
      cpu    = 1.0
      memory = "2Gi"

      env {
        name = "LEMMY_UI_LEMMY_INTERNAL_HOST"
        value = "lemmy:443" # container apps exposes 80/443 only
      }
      env {
        name = "LEMMY_UI_LEMMY_EXTERNAL_HOST"
        value = "feddit.deggymacets.com"
      }
      env {
        name = "LEMMY_UI_HTTPS"
        value = "true"
      }
    }
  }

  ingress {
    allow_insecure_connections = false
    target_port = 1234

    traffic_weight {
      percentage = 100
      latest_revision = true
    }
  }
}