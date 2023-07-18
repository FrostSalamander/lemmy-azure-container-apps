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
      cpu    = 0.5
      memory = "1Gi"

      env {
        name = "LEMMY_UI_LEMMY_INTERNAL_HOST"
        #value = azurerm_container_app.lemmy.latest_revision_fqdn
        value = "lemmy:80"
      }
      env {
        name = "LEMMY_UI_LEMMY_EXTERNAL_HOST"
        value = var.lemmy_external_fqdn
      }
      env {
        name = "LEMMY_UI_HTTPS"
        value = "true"
      }
    }
  }

  ingress {
    allow_insecure_connections = true
    target_port = 1234

    traffic_weight {
      percentage = 100
      latest_revision = true
    }
  }
}