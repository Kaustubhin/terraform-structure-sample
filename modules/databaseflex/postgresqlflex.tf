# Flexible Postgresql server #

resource "azurerm_postgresql_flexible_server" "flexpsqlsrv" {
  name                          = var.flex_psqlsrv_name
  location                      = var.location
  resource_group_name           = var.resource_group_name
  sku_name                      = var.flex_sku_name
  storage_mb                    = var.flex_storage_mb
  backup_retention_days         = var.flex_backup_retention_days
  geo_redundant_backup_enabled  = var.flex_geo_redundant_backup_enabled
  administrator_login           = var.flex_administrator_login
  administrator_password        = var.flex_administrator_login_password
  version                       = var.flex_psqlversion
   lifecycle {
    ignore_changes = [zone]
  }
  #public_network_access_enabled = var.flex_public_access
  tags                          = var.tags
}


resource "azurerm_postgresql_flexible_server_database" "flexpsqldb" {
  name                = var.flex_psqldb_name
  server_id           = azurerm_postgresql_flexible_server.flexpsqlsrv.id
  charset             = var.flex_charset
  collation           = var.flex_collation
  depends_on = [
    azurerm_postgresql_flexible_server.flexpsqlsrv
  ]
}


resource "azurerm_postgresql_flexible_server_firewall_rule" "flexsqlfirewall" {
  name                = "devcloud"
  server_id           = azurerm_postgresql_flexible_server.flexpsqlsrv.id
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
  depends_on = [
    azurerm_postgresql_flexible_server.flexpsqlsrv
  ]
}
