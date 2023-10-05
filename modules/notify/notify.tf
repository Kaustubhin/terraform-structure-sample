resource "azurerm_communication_service" "emailservice" {
  name                = var.communication_svc_name                                    // "oedp-communicationservice"
  resource_group_name = var.resource_group_name
  data_location       = var.data_region                                                             // "United States"
  tags = var.tags
}