resource "azurerm_portal_dashboard" "aks-board" {
  name                = var.dash_name
  resource_group_name = var.resource_group_name
  location            = var.location
  tags = var.tags
  dashboard_properties = templatefile("${path.module}/dash.tpl",
    {
      sub_id     = var.subscription_id
  })
}
