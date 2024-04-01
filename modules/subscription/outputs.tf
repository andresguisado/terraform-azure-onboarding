output "application_id" {
  value       = module.application.application_id
  description = "Application ID"
}

output "application_password" {
  value       = module.application.application_password
  description = "Application Password"
}

output "eventgrid_id" {
  value       = module.eventgrid.eventgrid_id
  description = "EventGrid ID"
}

output "aqua_cspm_scanner_role_definition_id" {
  value       = module.iam.aqua_cspm_scanner_role_definition_id
  description = "The ID of the created AQUA CSPM role definition"
}

output "aqua_agentless_scanner_role_definition_id" {
  value       = module.iam.aqua_agentless_scanner_role_definition_id
  description = "The ID of the created AQUA agentless role definition"
}

output "aqua_agentless_scanner_delete_role_definition_id" {
  value       = module.iam.aqua_agentless_scanner_delete_role_definition_id
  description = "The ID of the created AQUA agentless delete role definition"
}

# FIXME: unable to output
# output "virtual_networks_names" {
#   value = module.network.virtual_networks_names[*]["name"]
#   description = "Virtual Networks list"
# }

# output "security_groups_names" {
#   value = module.network.security_groups_names[*]["name"]
#   description = "Security Groups list"
# }

output "aqua_volscan_resource_group_name" {
  value       = var.aqua_create_network ? module.resource_group[0].aqua_volscan_resource_group_name : local.resource_group_name
  description = "Aqua volume scanning Resource Group Name"
}

output "resource_group_id" {
  value       = var.aqua_create_network ? module.resource_group[0].resource_group_id : data.azurerm_resource_group.resource_group[0].id
  description = "Resource Group ID"
}





