resource "azurerm_container_app" "pictrs" {
  name                         = "pictrs"
  container_app_environment_id = azurerm_container_app_environment.containerapp_env.id
  resource_group_name          = azurerm_resource_group.containerapp_rg.name
  revision_mode                = "Single"

  ingress {
    allow_insecure_connections = false
    target_port = 8080

    traffic_weight {
      percentage = 100
      latest_revision = true
    }
  }

  template {
    container {
      name   = "pictrs"
      image  = "asonix/pictrs:0.4.0"
      cpu    = 0.25
      memory = "0.5Gi"

      env {
        name = "PICTRS_OPENTELEMETRY_URL"
        value = "http://otel:4137"
      }
      env {
        name = "PICTRS__API_KEY"
        value = "postgres_password"
      }
      env {
        name = "RUST_LOG"
        value = "debug"
      }
      env {
        name = "RUST_BACKTRACE"
        value = "full"
      }
      env {
        name = "PICTRS__MEDIA__VIDEO_CODEC"
        value = "vp9"
      }
      env {
        name = "PICTRS__MEDIA__GIF__MAX_WIDTH"
        value = "256"
      }
      env {
        name = "PICTRS__MEDIA__GIF__MAX_HEIGHT"
        value = "256"
      }
      env {
        name = "PICTRS__MEDIA__GIF__MAX_AREA"
        value = "65536"
      }
      env {
        name = "PICTRS__MEDIA__GIF__MAX_FRAME_COUNT"
        value = "400"
      }
    }
  }
}