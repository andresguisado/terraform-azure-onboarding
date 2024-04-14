![Aquasecurity logo](https://avatars3.githubusercontent.com/u/12783832?s=200&v=4)

# Terraform-azure-onboarding
[![Release](https://img.shields.io/github/v/release/aquasecurity/terraform-azure-onboarding)](https://github.com/aquasecurity/terraform-azure-onboarding/releases)
[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)

This Terraform module provides an easy way
to configure Aqua Security’s CSPM and agentless solutions on Azure.

It creates the necessary resources, such as service accounts, roles, and permissions,
to enable seamless integration with Aqua’s platform.

---

## Table of Contents

- [Pre-requisites](#pre-requisites)
- [Usage](#usage)
- [Examples](#examples)
- [Using Existing Network](#using-existing-network)
- [Requirements](#requirements)
- [Providers](#providers)
- [Modules](#modules)
- [Resources](#resources)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Pre-requisites

Before using this module, ensure that you have the following:

- Terraform version `1.6.4` or later.
- `azure` CLI installed and configured.
- `Python` 3+ installed.
- Aqua Security account API credentials.

## Usage
1. Leverage the Aqua platform to generate the local variables required by the module.
2. Important: Replace `<aqua_api_key>` and `<aqua_api_secret>` with your generated API credentials.
3. Get from Azure console your Tenant ID. 
4. Run `az login --tenant <tenant_id>` to set your tenant.
5. Run `az account set --subscription <subscription_name>` to set azure cli context.
6. Run `terraform init` to initialize the module.
7. Run `terraform apply` to create the resources.

## Examples

Here's an example of how to use this module:

```hcl
module "aqua_azure_onboarding" {
    source                                = "aquasecurity/onboarding/azure"
    aqua_volscan_api_url                  = "aqua-volscan-api-url"
    aqua_volscan_api_token                = "aqua-volscan-api-token"
    aqua_volscan_resource_group_location  = "westus3"
    aqua_volscan_scan_locations           = ["australiaeast","australiasoutheast"]
    aqua_cspm_group_id                    = "cspm-group-id"
    aqua_configuration_id                 = "aqua-configuration-id"
    aqua_autoconnect_url                  = "aqua-autoconnect-url"
    aqua_api_key                          = "aqua-api-key"
    aqua_api_secret                       = "aqua-api-secret"
    aqua_custom_tags                      = { aqua = "true" }
}
```

## Using Existing Network

If you prefer to use existing networking instead of Aqua provisioning new ones,
you can do so by setting `create_network = false` in the module's input variables.
In this case, you will need to create,
prior to onboarding, the following resources with the following naming convention:

* Resource group:
  * Name `'aqua-agentless-scanner'`
  * Tag `aqua-agentless-scanner:true`
* Security group (per each chosen scan location):
  * Name `<resource-group-name>-<region>`. E.g., `aqua-agentless-scanner-centralus`
  * Tag `aqua-agentless-scanner:true`
* Virtual network (per each chosen scan location):
  * Name `<resource-group-name>-<region>`. E.g., `aqua-agentless-scanner-centralus`
  * Tag `aqua-agentless-scanner:true`
* Subnet (attached to the virtual network):
  * Name `<resource-group-name>`. E.g., `aqua-agentless-scanner`


<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.4 |
| <a name="requirement_azuread"></a> [azuread](#requirement\_azuread) | ~>2.47.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~>3.95.0 |
| <a name="requirement_external"></a> [external](#requirement\_external) | ~>2.3.3 |
| <a name="requirement_http"></a> [http](#requirement\_http) | ~>3.4.2 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_subscription"></a> [subscription](#module\_subscription) | ./modules/subscription | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aqua_api_key"></a> [aqua\_api\_key](#input\_aqua\_api\_key) | Aqua API key | `string` | n/a | yes |
| <a name="input_aqua_api_secret"></a> [aqua\_api\_secret](#input\_aqua\_api\_secret) | Aqua API secret key | `string` | n/a | yes |
| <a name="input_aqua_autoconnect_url"></a> [aqua\_autoconnect\_url](#input\_aqua\_autoconnect\_url) | Aqua AutoConnect URL | `string` | n/a | yes |
| <a name="input_aqua_configuration_id"></a> [aqua\_configuration\_id](#input\_aqua\_configuration\_id) | Aqua configuration ID | `string` | n/a | yes |
| <a name="input_aqua_cspm_group_id"></a> [aqua\_cspm\_group\_id](#input\_aqua\_cspm\_group\_id) | CSPM group ID | `string` | n/a | yes |
| <a name="input_aqua_cspm_role_name"></a> [aqua\_cspm\_role\_name](#input\_aqua\_cspm\_role\_name) | Aqua AutoConnect Scanner Role Name - The default value will be calculated as 'Aqua\_Auto\_Discovery\_Scanner\_Role\_<subscription\_id>' | `string` | `""` | no |
| <a name="input_aqua_custom_tags"></a> [aqua\_custom\_tags](#input\_aqua\_custom\_tags) | Client additional resource tags | `map(string)` | `{}` | no |
| <a name="input_aqua_event_subscriptions_name"></a> [aqua\_event\_subscriptions\_name](#input\_aqua\_event\_subscriptions\_name) | Aqua volume scanning Event Subscriptions Name | `string` | `"aqua-agentless-scanner"` | no |
| <a name="input_aqua_management_group_id"></a> [aqua\_management\_group\_id](#input\_aqua\_management\_group\_id) | Management Group ID | `string` | `""` | no |
| <a name="input_aqua_network_security_group_name"></a> [aqua\_network\_security\_group\_name](#input\_aqua\_network\_security\_group\_name) | Aqua volume scanning Network Security Group Name | `string` | `"aqua-agentless-scanner"` | no |
| <a name="input_aqua_subnet_name"></a> [aqua\_subnet\_name](#input\_aqua\_subnet\_name) | Aqua volume scanning Subnet Name | `string` | `"aqua-agentless-scanner"` | no |
| <a name="input_aqua_system_topics_name"></a> [aqua\_system\_topics\_name](#input\_aqua\_system\_topics\_name) | Aqua volume scanning Event Grid System Topic Name | `string` | `"aqua-agentless-scanner"` | no |
| <a name="input_aqua_virtual_network_name"></a> [aqua\_virtual\_network\_name](#input\_aqua\_virtual\_network\_name) | Aqua volume scanning Virtual Network Name | `string` | `"aqua-agentless-scanner"` | no |
| <a name="input_aqua_volscan_api_token"></a> [aqua\_volscan\_api\_token](#input\_aqua\_volscan\_api\_token) | Aqua volume scanning API token | `string` | n/a | yes |
| <a name="input_aqua_volscan_api_url"></a> [aqua\_volscan\_api\_url](#input\_aqua\_volscan\_api\_url) | Aqua Event Subscription webhook URL | `string` | n/a | yes |
| <a name="input_aqua_volscan_resource_group_location"></a> [aqua\_volscan\_resource\_group\_location](#input\_aqua\_volscan\_resource\_group\_location) | Aqua volume scanning Resource Group Location | `string` | `"eastus"` | no |
| <a name="input_aqua_volscan_resource_group_name"></a> [aqua\_volscan\_resource\_group\_name](#input\_aqua\_volscan\_resource\_group\_name) | Aqua volume scanning Resource Group Name | `string` | `"aqua-agentless-scanner"` | no |
| <a name="input_aqua_volscan_scan_locations"></a> [aqua\_volscan\_scan\_locations](#input\_aqua\_volscan\_scan\_locations) | List of Azure locations to scan - by default, all regions are selected | `list(string)` | <pre>[<br>  "eastus",<br>  "eastus2",<br>  "southcentralus",<br>  "westus2",<br>  "westus3",<br>  "australiaeast",<br>  "southeastasia",<br>  "northeurope",<br>  "swedencentral",<br>  "uksouth",<br>  "westeurope",<br>  "centralus",<br>  "southafricanorth",<br>  "centralindia",<br>  "eastasia",<br>  "japaneast",<br>  "koreacentral",<br>  "canadacentral",<br>  "francecentral",<br>  "germanywestcentral",<br>  "norwayeast",<br>  "switzerlandnorth",<br>  "uaenorth",<br>  "brazilsouth",<br>  "qatarcentral",<br>  "northcentralus",<br>  "westus",<br>  "westcentralus",<br>  "australiacentral",<br>  "australiasoutheast",<br>  "japanwest",<br>  "koreasouth",<br>  "southindia",<br>  "westindia",<br>  "canadaeast",<br>  "ukwest"<br>]</pre> | no |
| <a name="input_create_network"></a> [create\_network](#input\_create\_network) | Toggle to create network resources | `bool` | `true` | no |
| <a name="input_is_custom_name_vol_scan"></a> [is\_custom\_name\_vol\_scan](#input\_is\_custom\_name\_vol\_scan) | Toggle for custom names for volume scanning resources | `string` | `"false"` | no |
| <a name="input_show_outputs"></a> [show\_outputs](#input\_show\_outputs) | Toggle to show summary outputs after deployment | `bool` | `false` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_application_id"></a> [application\_id](#output\_application\_id) | Application ID |
| <a name="output_aqua_agentless_scanner_delete_role_definition_id"></a> [aqua\_agentless\_scanner\_delete\_role\_definition\_id](#output\_aqua\_agentless\_scanner\_delete\_role\_definition\_id) | The ID of the created Aqua agentless delete role definition |
| <a name="output_aqua_agentless_scanner_role_definition_id"></a> [aqua\_agentless\_scanner\_role\_definition\_id](#output\_aqua\_agentless\_scanner\_role\_definition\_id) | The ID of the created Aqua agentless role definition |
| <a name="output_aqua_cspm_scanner_role_definition_id"></a> [aqua\_cspm\_scanner\_role\_definition\_id](#output\_aqua\_cspm\_scanner\_role\_definition\_id) | The ID of the created Aqua CSPM role definition |
| <a name="output_aqua_volscan_resource_group_name"></a> [aqua\_volscan\_resource\_group\_name](#output\_aqua\_volscan\_resource\_group\_name) | Aqua volume scanning Resource Group Name |
| <a name="output_eventgrid_id"></a> [eventgrid\_id](#output\_eventgrid\_id) | EventGrid ID |
| <a name="output_resource_group_id"></a> [resource\_group\_id](#output\_resource\_group\_id) | Resource Group ID |
| <a name="output_security_groups_names"></a> [security\_groups\_names](#output\_security\_groups\_names) | Security Groups list |
| <a name="output_subscription_id"></a> [subscription\_id](#output\_subscription\_id) | Subscription ID |
| <a name="output_virtual_networks_names"></a> [virtual\_networks\_names](#output\_virtual\_networks\_names) | Virtual Networks list |
<!-- END_TF_DOCS -->
