variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

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

variable "tags" {
  type = map(string)
}

variable "eventhub_policy_name" {
  type = string
}
