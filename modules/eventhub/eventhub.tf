resource "azurerm_eventhub_namespace" "eventns" {
  name                = var.eventhub_namespace
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.eventhub_sku
  capacity            = var.eventhub_capacity
  zone_redundant = false
  # public_network_access_enabled = true

  tags = var.tags
 identity {
     type = "UserAssigned"
     identity_ids = var.eventhub_identity
  }
  
  network_rulesets {
      default_action                 = "Allow"
      ip_rule                        = []
      public_network_access_enabled  = true
      trusted_service_access_enabled = false
      virtual_network_rule           = []
    }
}

 

resource "azurerm_eventhub" "event_name" {
  for_each = var.eventhub_name
  name                = each.key
  namespace_name      = var.eventhub_namespace
  resource_group_name = var.resource_group_name
  partition_count     = var.eventhub_partition_count
  message_retention   = var.eventhub_message_retention
  depends_on = [
    azurerm_eventhub_namespace.eventns
  ]
}
resource "azurerm_eventhub_namespace_authorization_rule" "authorization" {
  name                = var.eventhub_policy_name
  namespace_name      = azurerm_eventhub_namespace.eventns.name
  resource_group_name = var.resource_group_name
  listen              = true
  send                = true
  manage              = false
  depends_on = [
    azurerm_eventhub_namespace.eventns
  ]

}

