variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
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
