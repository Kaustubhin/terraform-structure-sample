
resource "azurerm_storage_account" "appstracc" {
  name                     = var.app_stracc_name
  resource_group_name      = var.resource_group_name
  location                 = var.app_location
  account_tier             = var.app_str_account_tier
  account_replication_type = var.app_str_account_replication_type
}

resource "azurerm_app_service_plan" "appservice" {
  name                = var.app_service_plan
  location            = var.app_location
  resource_group_name = var.resource_group_name
  kind                = var.kind
  reserved            = true
  #sku_name = var.app_sku
  sku {
    tier = var.app_tier
    size = var.app_size
  }

  lifecycle {
    ignore_changes = [
      kind
    ]
  }
}

resource "azurerm_function_app" "function" {
  name                       = var.app_name
  location                   = var.app_location
  resource_group_name        = var.resource_group_name
  app_service_plan_id        = azurerm_app_service_plan.appservice.id
  storage_account_name       = var.app_stracc_name
  storage_account_access_key = azurerm_storage_account.appstracc.primary_access_key
  os_type                    = var.app_os
  version                    = var.app_version
  app_settings = {
    FUNCTIONS_WORKER_RUNTIME = var.language
  }

  site_config {
    linux_fx_version = var.py_ver
  }

}


