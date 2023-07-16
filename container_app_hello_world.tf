resource "azurerm_container_app" "hello_world" {
  name                         = "hello-world"
  container_app_environment_id = azurerm_container_app_environment.containerapp_env.id
  resource_group_name          = azurerm_resource_group.containerapp_rg.name
  revision_mode                = "Single"

  template {

    min_replicas = 1
    max_replicas = 1

    container {
      name   = "hello-world"
      image  = "mcr.microsoft.com/azuredocs/containerapps-helloworld:latest"
      cpu    = 0.5
      memory = "1Gi"
    }
  }

  ingress {
    allow_insecure_connections = true
    target_port = 80

    traffic_weight {
      percentage = 100
      latest_revision = true
    }
  }
}