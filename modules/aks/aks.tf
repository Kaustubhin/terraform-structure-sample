# resource "azurerm_resource_group" "rg" {
#     name     = var.resource_group_name
#     location = var.location
#     tags     = var.tags
# } 

# resource "azurerm_private_dns_zone" "aksdns" {
#   name                = var.aks_private_dns_zone
#   resource_group_name = var.resource_group_name
# }


resource "azurerm_kubernetes_cluster" "cluster" {
  name                    = var.aks_cluster_name
  location                = var.location
  resource_group_name     = var.resource_group_name
  dns_prefix              = var.aks_dns_prefix
  private_cluster_enabled = var.aks_private_cluster_enabled
  # private_dns_zone_id     = var.aks_private_dns_zone


  default_node_pool {
    name                = var.aks_nodepool_name
    node_count          = var.aks_node_count
    vm_size             = var.aks_vm_size
    type                = var.aks_vm_type
    zones               = var.aks_az
    enable_auto_scaling = var.aks_enable_auto_scaling
    min_count           = var.aks_vm_min_count
    max_count           = var.aks_vm_min_count
    # vnet_subnet_id = var.aks_vnet_subnet_id

  }
  # Add On Profiles

    # oms_agent {
    #   log_analytics_workspace_id  = var.aks_log_analytics_workspace_id
    # }
  
  # api_server_access_profile{
  #   authorized_ip_ranges =["0.0.0.0/32"]
  # }
  
  # service_principal {
  #   client_id     = var.client_id
  #   client_secret = var.client_secret
  # }
  # addon_profile {
  #   kube_dashboard {
  #     enabled = true
  #   }
  #   azure_policy {
  #     enabled = true
  #   }

  #   pod_identity {
  #     enabled = true
  #     principal_id = azurerm_user_assigned_identity.podid.principal_id
  #   }

  # }


  identity {
    type = var.aks_identity_type 
  }


  network_profile {
    network_plugin    = "azure"
    load_balancer_sku = "standard"
    network_policy    = "calico"
  }

  tags = var.tags


}

resource "azurerm_role_assignment" "acr_pull" {
  scope                            = var.acr_id
  role_definition_name             = "AcrPull"
  principal_id                     = azurerm_kubernetes_cluster.cluster.kubelet_identity[0].object_id
  skip_service_principal_aad_check = true

  depends_on = [
    azurerm_kubernetes_cluster.cluster
  ]
}

