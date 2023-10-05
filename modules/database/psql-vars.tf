variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}

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

# flex server


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

variable "flex_ssl_enforcement_enabled" {

  type = bool
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
