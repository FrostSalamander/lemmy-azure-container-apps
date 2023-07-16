resource "azurerm_container_app" "lemmy" {
  name                         = "lemmy"
  container_app_environment_id = azurerm_container_app_environment.containerapp_env.id
  resource_group_name          = azurerm_resource_group.containerapp_rg.name
  revision_mode                = "Single"

  template {

    min_replicas = 1
    max_replicas = 1

    container {
      name   = "lemmy"
      image  = var.lemmy_image
      cpu    = 0.5
      memory = "1Gi"

      env {
        name = "RUST_LOG"
        value = "verbose"
      }
      env {
        name = "LEMMY_DATABASE_URL"
        secret_name = "pgconnectionstring"
      }
    }
  }

  secret {
    name = "pgconnectionstring"
    value = var.pgconnectionstring
  }

  ingress {
    allow_insecure_connections = true
    target_port = 8536

    traffic_weight {
      percentage = 100
      latest_revision = true
    }
  }

}