resource "azurerm_log_analytics_workspace" "logsws" {
  name                = var.eventdriven_ws_name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.eventdriven_sku
  retention_in_days   = var.eventdriven_retention_days
}