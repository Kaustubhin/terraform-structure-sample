variable "resource_group_name" {
  type = string
}

variable "app_location" {
  type = string
}

variable "tags" {
  type = map(string)
}


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

variable "py_ver" {
  type = string
}


variable "app_tier" {
  type = string
}
variable "app_size" {
  type = string
}

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