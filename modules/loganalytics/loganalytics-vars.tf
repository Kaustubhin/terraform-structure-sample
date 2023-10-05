variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "eventdriven_ws_name" {
  type = string
}


variable "eventdriven_sku" {
  type = string
}


variable "eventdriven_retention_days" {
  type = string
}
