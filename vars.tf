// Providers Variables

variable "subscription_id" {
    type = string

}
variable "client_id" {
    type = string

}
variable "client_secret" {
    type = string

}
variable "tenant_id" {
    type = string

}

# Resource Group Values

variable "resource_group_name" {
    type = string  
}

variable "location" {
    type = string
}

variable "tags" {
    type        = map(string)
}


# Virtual Network and Subnets Vaules 

variable "nsg_name" {
  type = string
}

variable "vnet_name" {
  type = string
}

variable "address_space" {
  type = list(string)
}

variable "dns_servers" {
  type = list(string)
}

variable "pvt_subnet1" {
  type = string
}

variable "pvt_subnet2" {
  type = string
}

variable "pub_subnet1" {
  type = string
}

variable "pub_subnet2" {
  type = string
}

variable "pvt_aks_subnet" {
  type = string
}

# variable "eventdriven_nat_name" {
#   type = string
# }

variable "address_prefix_pvt_aks_subnet" {
  type = list(string)
}

variable "address_prefix_pvt_subnet1" {
  type = list(string)
}

variable "address_prefix_pvt_subnet2" {
  type = list(string)
}

variable "address_prefix_pub_subnet1" {
  type = list(string)
}

variable "address_prefix_pub_subnet2" {
  type = list(string)
}


# PostgreSQL Values

variable "psqlsrv_name" {
  type = string
}

variable "psqldb_name" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "storage_mb" {
  type = string
}


variable "backup_retention_days" {
  type = string
}

variable "geo_redundant_backup_enabled" {
  type = bool
}

variable "auto_grow_enabled" {
  type = bool
}

variable "administrator_login" {
  type = string
}

variable "administrator_login_password" {
  type = string
}

variable "psqlversion" {
  type = string
}

variable "ssl_enforcement_enabled" {

  type = bool
}

variable "charset" {
  type = string
}

variable "collation" {
  type = string
}

variable "psqlsubnetid" {
  type = string
  
}

# Flexible Postgresql server

variable "flex_psqlsrv_name" {
  type = string
}

variable "flex_psqldb_name" {
  type = string
}

variable "flex_sku_name" {
  type = string
}

variable "flex_storage_mb" {
  type = string
}


variable "flex_backup_retention_days" {
  type = string
}

variable "flex_geo_redundant_backup_enabled" {
  type = bool
}

variable "flex_auto_grow_enabled" {
  type = bool
}

variable "flex_administrator_login" {
  type = string
}

variable "flex_administrator_login_password" {
  type = string
}

variable "flex_psqlversion" {
  type = string
}


variable "flex_charset" {
  type = string
}

variable "flex_collation" {
  type = string
}

variable "flex_psqlsubnetid" {
  type = string

}

variable "flex_public_access" {
  type = bool
}

# Storage Acoount Values

variable "stracc_name" {
  type = string
}

variable "strcon_name" {
  type = string
}

variable "strcon2_name" {
  type = string
}

variable "strque_name" {
  type = string
}

variable "str_account_tier" {
  type = string
}

variable "str_account_replication_type" {
  type = string
}

variable "str_container_access_type" {
  type = string
}



# Azure Container Registry Vaules


variable "acr_name" {
  type = string
}

variable "acr_sku" {
  type = string
}

variable "acr_admin_enabled" {
  type = bool
}


# Azure Kubernetes Cluster Values.



variable "aks_cluster_name" {
    type = string
}

variable "aks_dns_prefix" {
    type = string
}

variable "aks_nodepool_name" {
    type = string
}

variable "aks_node_count" {
    type = string
}

variable "aks_vm_size" {
    type = string
}

variable "aks_vm_type" {
    type = string
}

variable "aks_az" {
    type = list(string)
}

variable "aks_enable_auto_scaling" {
    type = bool
}

variable "aks_vm_min_count" {
    type = string
}

variable "aks_vm_max_count" {
    type = string
}

variable "aks_log_analytics_workspace_id" {
  type = string
}
# variable "aks_vnet_subnet_id" {
#     type = string
# }

variable "aks_identity_type" {
    type = string
}

# variable "aks_private_dns_zone" {
#     type = string
# }

variable "aks_private_cluster_enabled" {
    type = bool
}


variable "acr_id" {
  type = string
}



# Azure Private DNS zone


variable "dns_zone_name" {
  type = string
}


# Azure Eventhub Vaules 


variable "eventhub_namespace" {
  type = string

}

variable "eventhub_sku" {
  type = string

}

variable "eventhub_name" {
  type = set(string)
}

variable "eventhub_identity" {
  type = set(string)
}

variable "eventhub_capacity" {
  type = string
} 


variable "eventhub_partition_count" {
  type = string
} 

variable "eventhub_message_retention" {
  type = string
} 

variable "eventhub_policy_name" {
  type = string
}

# Azure loganalytics Workspace

variable "eventdriven_ws_name" {
  type = string
}


variable "eventdriven_sku" {
  type = string
}


variable "eventdriven_retention_days" {
  type = string
}


# #AKS Dashboard

variable "dash_name" {
    type = string

}


# Azure Function App

variable "app_name" {
  type = string
}

variable "app_service_plan" {
  type = string
}

variable "app_stracc_name" {
  type = string
}

variable "app_str_account_tier" {
  type = string
}

variable "app_str_account_replication_type" {
  type = string
}

variable "app_location" {
  type = string
}

variable "py_ver" {
  type = string
}

variable "app_tier" {
  type = string
}
variable "app_size" {
  type = string
}

# variable "app_sku" {
#   type = map(string)
# }

variable "kind" {
  type = string
}

variable "language" {
  type = string
}

variable "app_os" {
  type = string
}

variable "app_version" {
  type = string
}


# Azure communication Service

variable "communication_svc_name" {
  type = string

}

variable "data_region" {
  type = string

}