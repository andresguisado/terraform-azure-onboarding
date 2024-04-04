module "subscription" {
  source = "./modules/subscription"

  aqua_management_group_id = var.aqua_management_group_id
  env                      = local.env
  subscription_id          = local.subscription_id

  aqua_custom_tags         = var.aqua_custom_tags

  application_name              = local.application_name

  aqua_volscan_resource_group_name     = var.aqua_volscan_resource_group_name
  aqua_volscan_resource_group_location = var.aqua_volscan_resource_group_location

  cspm_role_scope = local.cspm_role_scope

  aqua_autoconnect_url   = var.aqua_autoconnect_url
  aqua_volscan_api_url   = var.aqua_volscan_api_url
  aqua_volscan_api_token = var.aqua_volscan_api_token
  aqua_api_key           = var.aqua_api_key
  aqua_api_secret        = var.aqua_api_secret
  aqua_configuration_id  = var.aqua_configuration_id
  aqua_cspm_group_id     = var.aqua_cspm_group_id

  create_network              = var.aqua_create_network
  aqua_virtual_network_name        = var.aqua_virtual_network_name
  is_custom_name_vol_scan          = var.is_custom_name_vol_scan
  aqua_cspm_role_name              = local.aqua_cspm_role_name
  aqua_subnet_name                 = var.aqua_subnet_name
  aqua_network_security_group_name = var.aqua_network_security_group_name
  aqua_system_topics_name          = var.aqua_system_topics_name
  aqua_volscan_scan_locations      = var.aqua_volscan_scan_locations
  aqua_event_subscriptions_name    = var.aqua_event_subscriptions_name
}