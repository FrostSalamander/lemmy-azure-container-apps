resource "azurerm_resource_group" "containerapp_rg" {
  name     = "containerapp-rg"
  location = var.location
}