# Resource Group Values
resource_group_name = "rg-dev"
location            = "Central US"
tags                = { environment = "Test", Owner = "me" }


# PostgreSQl Values

psqlsrv_name                 = "dbs-dev"
psqldb_name                  = "db-dev"
sku_name                     = "GP_Gen5_2"
storage_mb                   = "5120"
backup_retention_days        = "7"
geo_redundant_backup_enabled = false
auto_grow_enabled            = true
administrator_login          = "psqladmin"
administrator_login_password = "ps@dmin123"
psqlversion                  = "11"
ssl_enforcement_enabled      = true
charset                      = "UTF8"
collation                    = "English_United States.1252"
psqlsubnetid                 = "DBID"


# Flexible PostgreSQl Values

flex_psqlsrv_name                 = "flexsql-dev"
flex_psqldb_name                  = "flexsqldb-dev"
flex_sku_name                     = "B_Standard_B1ms"
flex_storage_mb                   = "32768"
flex_backup_retention_days        = "7"
flex_geo_redundant_backup_enabled = false
flex_auto_grow_enabled            = true
flex_administrator_login          = "psqladmin"
flex_administrator_login_password = "psflex@dmin123"
flex_psqlversion                  = "11"
flex_charset                      = "UTF8"
flex_collation                    = "en_US.utf8"
flex_public_access                = true
flex_psqlsubnetid                 = "flexDBID"



# Virtual Network and Subnets Values

nsg_name                      = "dev-nsg"
vnet_name                     = "vnet-dev"
address_space                 = ["10.11.0.0/16"]
dns_servers                   = ["10.11.0.4", "10.11.0.5"]
pvt_subnet1                = "pvt_sub1"
pvt_subnet2                = "pvt_sub2"
pub_subnet1                = "pub_sub1"
pub_subnet2                = "pub_sub2"
pvt_aks_subnet             = "aks_subnet"
address_prefix_pvt_aks_subnet = ["10.11.4.0/22"]
address_prefix_pvt_subnet1    = ["10.11.10.0/24"]
address_prefix_pvt_subnet2    = ["10.11.20.0/24"]
address_prefix_pub_subnet1    = ["10.11.30.0/24"]
address_prefix_pub_subnet2    = ["10.11.40.0/24"]


# Storage account Vaules

stracc_name                  = "devacc"
str_account_tier             = "Standard"
str_account_replication_type = "LRS"
strcon_name                  = "devfiles"
strcon2_name                 = "producerdata"
strque_name                  = "devqueue"
str_container_access_type    = "private"



# Azure Container Registry Vaules

acr_name          = "devacr01"
acr_sku           = "Standard"
acr_admin_enabled = true


# Azure Kubernetes Cluster vaules

aks_cluster_name        = "devaks01"
aks_dns_prefix          = "devaks01-dns"
aks_nodepool_name       = "aksdefault"
aks_node_count          = 4
aks_vm_size             = "Standard_B2ms"
aks_vm_type             = "VirtualMachineScaleSets"
aks_az                  = ["1"]
aks_enable_auto_scaling = true
aks_vm_min_count        = 4
aks_vm_max_count        = 5
aks_identity_type = "SystemAssigned"

aks_private_cluster_enabled    = false
aks_log_analytics_workspace_id = "/subscriptions/../logswsdev-01"
acr_id                         = "/subscriptions/../devacr01"


# Azure Private DNS zone

dns_zone_name = "privatelink.centralus.azmk8s.io"



# Azure Event Hub valuse


eventhub_namespace = "devns01"
#eventhub_sku       = "Standard"
eventhub_sku       = "Premium"
eventhub_name              = ["dev01", "dev02", "dev02"]

eventhub_capacity          = "1"
eventhub_partition_count   = "2"
eventhub_message_retention = "1"
eventhub_policy_name       = "dev-policy"
eventhub_identity          = ["Enventhub-ID"]

# Azure loganalytics Workspace

dev_ws_name        = "logswsdev-01"
dev_sku            = "PerGB2018"
dev_retention_days = "30"


# AKS DhashBoard

dash_name = "AKS-DashBoard"


# Azure App Function

app_name                         = "appfuncdev"
app_service_plan                 = "appservicedev"
app_stracc_name                  = "appfunctiondevacc"
app_str_account_tier             = "Standard"
app_str_account_replication_type = "LRS"
app_tier                         = "Dynamic"
language                         = "python"
app_size                         = "B1"
app_os                           = "linux"
app_version                      = "~4"
kind                             = "Linux"
app_location                     = "East US"
py_ver                           = "python|3.9"



# Azure communication service

communication_svc_name = "dev-communicationservice"
data_region            = "United States"
