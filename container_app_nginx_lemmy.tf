resource "azurerm_container_app" "nginx_lemmy" {
  name                         = "nginx-lemmy"
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
      name   = "nginx-lemmy"
      image  = var.nginx_image
      cpu    = 0.5
      memory = "1Gi"
    }
  }

  ingress {
    allow_insecure_connections = false
    external_enabled = true
    target_port = 8080

    custom_domain {
      certificate_binding_type = "SniEnabled"
      certificate_id = azurerm_container_app_environment_certificate.containerapp_cert.id
      name = var.lemmy_external_fqdn
    }

    traffic_weight {
      percentage = 100
      latest_revision = true
    }
  }
}