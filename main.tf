# Declaretion of Provider

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.44.1"
    }
    local = {
      source = "hashicorp/local"
    }
  }
  backend "azurerm" {
    resource_group_name  = "tfstate"
    storage_account_name = "tfstateoedp"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

# Provider Configuration

provider "azurerm" {
  subscription_id = var.subscription_id
  client_id       = var.client_id
  client_secret   = var.client_secret
  tenant_id       = var.tenant_id
  features {}
  skip_provider_registration = true
}

# Azure Resource Group

module "rg" {
  source              = "./modules/resource_group"
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
}

# Azure Vnet

module "network" {
  source                        = "./modules/network"
  vnet_name                     = var.vnet_name
  address_space                 = var.address_space
  nsg_name                      = var.nsg_name
  dns_servers                   = var.dns_servers
  pvt_subnet1                   = var.pvt_subnet1
  pvt_subnet2                   = var.pvt_subnet2
  pub_subnet1                   = var.pub_subnet1
  pub_subnet2                   = var.pub_subnet2
  pvt_aks_subnet                = var.pvt_aks_subnet
  address_prefix_pvt_aks_subnet = var.address_prefix_pvt_aks_subnet
  address_prefix_pvt_subnet1    = var.address_prefix_pvt_subnet1
  address_prefix_pvt_subnet2    = var.address_prefix_pvt_subnet2
  address_prefix_pub_subnet1    = var.address_prefix_pub_subnet1
  address_prefix_pub_subnet2    = var.address_prefix_pub_subnet2
  resource_group_name = var.resource_group_name
  location            = var.location
  tags                = var.tags
  depends_on = [
    module.rg
  ]

}


# Azure DNS
module "dns" {
  source              = "./modules/dns"
  dns_zone_name       = var.dns_zone_name
  resource_group_name = var.resource_group_name
  tags                = var.tags
}

# Azure PostgreSQL

# module "database" {
#   source                       = "./modules/database"
#   psqlsrv_name                 = var.psqlsrv_name
#   psqldb_name                  = var.psqldb_name
#   sku_name                     = var.sku_name
#   storage_mb                   = var.storage_mb
#   backup_retention_days        = var.backup_retention_days
#   geo_redundant_backup_enabled = var.geo_redundant_backup_enabled
#   auto_grow_enabled            = var.auto_grow_enabled
#   administrator_login          = var.administrator_login
#   administrator_login_password = var.administrator_login_password
#   psqlversion                  = var.psqlversion
#   ssl_enforcement_enabled      = var.ssl_enforcement_enabled
#   charset                      = var.charset
#   collation                    = var.collation
#   resource_group_name          = var.resource_group_name
#   location                     = var.location
#   tags                         = var.tags
#   psqlsubnetid                 = var.psqlsubnetid
#   depends_on = [
#     module.rg, module.network
#   ]
# }


#Azure flex postgresql

module "databaseflex" {
  source                            = "./modules/databaseflex"
  flex_psqlsrv_name                 = var.flex_psqlsrv_name
  flex_psqldb_name                  = var.flex_psqldb_name
  flex_sku_name                     = var.flex_sku_name
  flex_storage_mb                   = var.flex_storage_mb
  flex_backup_retention_days        = var.flex_backup_retention_days
  flex_geo_redundant_backup_enabled = var.flex_geo_redundant_backup_enabled
  flex_auto_grow_enabled            = var.flex_auto_grow_enabled
  flex_administrator_login          = var.flex_administrator_login
  flex_administrator_login_password = var.flex_administrator_login_password
  flex_psqlversion                  = var.flex_psqlversion
  flex_charset                      = var.flex_charset
  flex_collation                    = var.flex_collation
  flex_public_access                = var.flex_public_access
  flex_psqlsubnetid                 = var.flex_psqlsubnetid
  resource_group_name               = var.resource_group_name
  location                          = var.location
  tags                              = var.tags

  depends_on = [
    module.rg, module.network
  ]
}




# Azure Storage

module "storage" {
  source                       = "./modules/storage"
  stracc_name                  = var.stracc_name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  str_account_tier             = var.str_account_tier
  str_account_replication_type = var.str_account_replication_type
  strcon_name                  = var.strcon_name
  strcon2_name                 = var.strcon2_name
  strque_name                  = var.strque_name
  str_container_access_type    = var.str_container_access_type
  tags                         = var.tags
  depends_on = [
    module.rg
  ]
}

# Azure Container Registry

module "acr" {
  source              = "./modules/acr"
  acr_name            = var.acr_name
  resource_group_name = var.resource_group_name
  location            = var.location
  acr_sku             = var.acr_sku
  acr_admin_enabled   = var.acr_admin_enabled
  tags                = var.tags
  depends_on = [
    module.rg
  ]
}

# Azure Kubernetes Service 

module "aks" {
  source                         = "./modules/aks"
  resource_group_name            = var.resource_group_name
  aks_cluster_name               = var.aks_cluster_name
  aks_dns_prefix                 = var.aks_dns_prefix
  aks_nodepool_name              = var.aks_nodepool_name
  aks_node_count                 = var.aks_node_count
  aks_vm_size                    = var.aks_vm_size
  aks_vm_type                    = var.aks_vm_type
  aks_az                         = var.aks_az
  aks_enable_auto_scaling        = var.aks_enable_auto_scaling
  aks_vm_min_count               = var.aks_vm_min_count
  aks_vm_max_count               = var.aks_vm_max_count
  aks_log_analytics_workspace_id = var.aks_log_analytics_workspace_id
  aks_identity_type = var.aks_identity_type
  acr_id            = var.acr_id
  client_id         = var.client_id
  client_secret     = var.client_secret
  aks_private_cluster_enabled = var.aks_private_cluster_enabled
  tags                        = var.tags
  location                    = var.location
  depends_on = [
    module.rg, module.acr
  ]
}

# Azure EventHub

module "eventhub" {
  source                     = "./modules/eventhub"
  eventhub_namespace         = var.eventhub_namespace
  eventhub_sku               = var.eventhub_sku
  eventhub_name              = var.eventhub_name
  eventhub_capacity          = var.eventhub_capacity
  eventhub_identity          = var.eventhub_identity
  eventhub_partition_count   = var.eventhub_partition_count
  eventhub_policy_name       = var.eventhub_policy_name
  eventhub_message_retention = var.eventhub_message_retention
  tags                       = var.tags
  location                   = var.location
  resource_group_name        = var.resource_group_name
  depends_on = [
    module.rg
  ]
}


#Azure loganalytics Workspace

module "loganalytics" {
  source                     = "./modules/loganalytics"
  eventdriven_ws_name        = var.eventdriven_ws_name
  eventdriven_sku            = var.eventdriven_sku
  eventdriven_retention_days = var.eventdriven_retention_days
  resource_group_name        = var.resource_group_name
  location                   = var.location
  tags                       = var.tags
  depends_on = [
    module.rg
  ]
}


# AKS DashBoard

module "dashboard" {
  source              = "./modules/dashboard"
  dash_name           = var.dash_name
  resource_group_name = var.resource_group_name
  location            = var.location
  subscription_id     = var.subscription_id
  tags                = var.tags
  depends_on = [
    module.rg, module.aks
  ]
}


# Azure Function Application

module "function" {
  source                           = "./modules/function"
  app_name                         = var.app_name
  app_location                     = var.app_location
  resource_group_name              = var.resource_group_name
  app_service_plan                 = var.app_service_plan
  app_stracc_name                  = var.app_stracc_name
  app_str_account_tier             = var.app_str_account_tier
  app_str_account_replication_type = var.app_str_account_replication_type
  language                         = var.language
  app_os                           = var.app_os
  app_tier                         = var.app_tier
  app_size                         = var.app_size
  py_ver                           = var.py_ver
  tags                             = var.tags
  app_version                      = var.app_version
  kind                             = var.kind
  depends_on = [
    module.rg
  ]

}


# Azure Communication Service

module "notify" {
  source                 = "./modules/notify"
  communication_svc_name = var.communication_svc_name
  data_region            = var.data_region
  resource_group_name    = var.resource_group_name
  location               = var.location
  tags                   = var.tags
  depends_on = [
    module.rg
  ]

}
