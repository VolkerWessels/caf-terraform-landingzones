# For full description on enterprise_scale module usage, please refer to https://github.com/Azure/terraform-azurerm-caf-enterprise-scale

module "enterprise_scale" {
  source = "git::https://github.com/Azure/terraform-azurerm-caf-enterprise-scale.git?ref=main"

  # source  = "Azure/caf-enterprise-scale/azurerm"
  # version = "1.1.3"

  # source = "/tf/caf/alz"

  providers = {
    azurerm              = azurerm
    azurerm.connectivity = azurerm
    azurerm.management   = azurerm
  }

  root_parent_id   = var.root_parent_id == null ? data.azurerm_client_config.core.tenant_id : var.root_parent_id
  default_location = local.global_settings.regions[local.global_settings.default_region]

  #path to the policies definition and assignment repo
  library_path                   = var.library_path
  archetype_config_overrides     = local.archetype_config_overrides
  custom_landing_zones           = local.custom_landing_zones
  deploy_core_landing_zones      = var.deploy_core_landing_zones
  root_id                        = var.root_id
  root_name                      = var.root_name
  subscription_id_overrides      = local.subscription_id_overrides
  subscription_id_identity       = var.subscription_id_identity
  subscription_id_management     = var.subscription_id_management
  deploy_identity_resources      = var.deploy_identity_resources
  configure_identity_resources   = var.configure_identity_resources
  deploy_management_resources    = var.deploy_management_resources
  configure_management_resources = var.configure_management_resources
  disable_base_module_tags       = var.disable_base_module_tags
}
