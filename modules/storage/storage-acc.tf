resource "azurerm_storage_account" "stracc" {
  name                     = var.stracc_name
  resource_group_name      = var.resource_group_name
  location                 = var.location
  account_tier             = var.str_account_tier
  account_replication_type = var.str_account_replication_type
  tags                     = var.tags

}

resource "azurerm_storage_container" "strcon" {
  name                  = var.strcon_name
  storage_account_name  = azurerm_storage_account.stracc.name
  container_access_type = var.str_container_access_type
}


resource "azurerm_storage_container" "strcon2" {
  name                  = var.strcon2_name
  storage_account_name  = azurerm_storage_account.stracc.name
  container_access_type = var.str_container_access_type
}

resource "azurerm_storage_queue" "strque" {
  name                 = var.strque_name
  storage_account_name = azurerm_storage_account.stracc.name
}