variable "tags" {
  type        = map(string)
  description = "Tags"
}

variable "aqua_system_topics_name" {
  type        = string
  description = "Aqua Event Grid System Topics"
}

variable "aqua_event_subscriptions_name" {
  type        = string
  description = "Aqua Event Subscriptions Name"
}

variable "event_subscription_filter" {
  type        = string
  description = "Aqua Event Subscription Filter"
}

variable "event_subscription_delivery_name" {
  type        = string
  description = "Aqua Event Subscription delivery name"
}

variable "event_subscription_delivery_type" {
  type        = string
  description = "Aqua Event Subscription delivery type"
}

variable "aqua_volscan_api_url" {
  type        = string
  description = "Aqua volume scanning API URL"
}

variable "aqua_volscan_api_token" {
  type        = string
  description = "Aqua volume scanning API token"
}

variable "aqua_volscan_resource_group_name" {
  type        = string
  description = "Aqua volume scanning Resource Group Name"
}

variable "resource_group_id" {
  type        = string
  description = "Resource Group ID"
}