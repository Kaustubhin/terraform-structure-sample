resource "azurerm_postgresql_server" "psqlsrv" {
  name                         = var.psqlsrv_name
  location                     = var.location
  resource_group_name          = var.resource_group_name
  sku_name                     = var.sku_name
  storage_mb                   = var.storage_mb
  backup_retention_days        = var.backup_retention_days
  geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
  auto_grow_enabled            = var.auto_grow_enabled
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  version                      = var.psqlversion
  ssl_enforcement_enabled      = var.ssl_enforcement_enabled
  tags                         = var.tags
}

resource "azurerm_postgresql_database" "psqldb" {
  name                = var.psqldb_name
  resource_group_name = var.resource_group_name
  server_name         = var.psqlsrv_name
  charset             = var.charset
  collation           = var.collation
  depends_on = [
    azurerm_postgresql_server.psqlsrv
  ]
}

# resource "azurerm_postgresql_virtual_network_rule" "psqlsubnet" {
#   name                                 = "postgresql-vnet-rule"
#   resource_group_name                  = var.resource_group_name
#   server_name                          = azurerm_postgresql_server.psqlsrv.name
#   subnet_id                            = var.psqlsubnetid
#   ignore_missing_vnet_service_endpoint = true
# }

resource "azurerm_postgresql_firewall_rule" "sqlfirewall" {
  name                = "devcloud"
  resource_group_name = var.resource_group_name
  server_name         = azurerm_postgresql_server.psqlsrv.name
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}