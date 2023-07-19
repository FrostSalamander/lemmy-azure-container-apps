# This shouldn't be required, but: https://github.com/hashicorp/terraform-provider-azurerm/issues/20748
resource "azurerm_log_analytics_workspace" "containerapp_ws" {
  name                = "containerapp-ws"
  location            = azurerm_resource_group.containerapp_rg.location
  resource_group_name = azurerm_resource_group.containerapp_rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_container_app_environment" "containerapp_env" {
  name                       = "capp-01"
  location                   = azurerm_resource_group.containerapp_rg.location
  resource_group_name        = azurerm_resource_group.containerapp_rg.name
  log_analytics_workspace_id = azurerm_log_analytics_workspace.containerapp_ws.id
}

resource "azurerm_container_app_environment_certificate" "containerapp_cert" {
  name                         = "cf-cert"
  container_app_environment_id = azurerm_container_app_environment.containerapp_env.id
  certificate_blob             = var.container_env_cert
  certificate_password         = ""
}

