/*
resource "azurerm_storage_account" "containerapp_storage" {
  name                     = "876saf8as7fstorage"
  resource_group_name      = azurerm_resource_group.containerapp_rg.name
  location                 = azurerm_resource_group.containerapp_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_share" "containerapp_storage_share" {
  name                 = "app01share"
  storage_account_name = azurerm_storage_account.containerapp_storage.name
  quota                = 5
}

resource "azurerm_storage_share_file" "nginx_config" {
  name             = "nginx-config"
  storage_share_id = azurerm_storage_share.containerapp_storage_share.id
  source           = "nginx.conf"
}

resource "azurerm_container_app_environment_storage" "example" {
  name                         = "app01storage"
  container_app_environment_id = azurerm_container_app_environment.containerapp.id
  account_name                 = azurerm_storage_account.containerapp_storage.name
  share_name                   = azurerm_storage_share.containerapp_storage_share.name
  access_key                   = azurerm_storage_account.containerapp_storage.primary_access_key
  access_mode                  = "ReadOnly"
}
*/