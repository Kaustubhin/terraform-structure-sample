resource "azurerm_private_dns_zone" "pvdns" {
  name                = var.dns_zone_name
  resource_group_name = var.resource_group_name
}