variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
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

variable "address_prefix_pvt_aks_subnet" {
  type = list(string)
}

# variable "eventdriven_nat_name" {
#   type = string
# }

# variable "public_ip_name" {
#   type = string
# }

# variable "ip_allocation_method" {
#   type = string
# }

# variable "lb_name" {
#   type = string
# }

# variable "evd_ip_name" {
#   type = string
# }