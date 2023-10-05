variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
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
#   type = string
# }

variable "aks_identity_type" {
  type = string
}

# variable "aks_private_dns_zone" {
#   type = string
# }

variable "aks_private_cluster_enabled" {
  type = bool
}

variable "client_id" {
  type = string
}

variable "client_secret" {
  type = string
}


variable "acr_id" {
  type = string
}


# variable "kubelet_id" {
#   type = string
# }


# variable "aks_profile" {
#   type = map(string)
# }

