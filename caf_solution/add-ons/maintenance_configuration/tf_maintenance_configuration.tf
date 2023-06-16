resource "azurerm_maintenance_configuration" "mc" {
  for_each = try(var.azurerm_maintenance_configurations, {})

  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  location   = try(each.value.region1)
  scope      = try(each.value.scope, null)
  visibility = try(each.value.visibility, null)
  window = {
    start_date_time      = try(each.value.start_date_time, null)
    expiration_date_time = try(each.value.expiration_date_time, null)
    recur_every          = try(each.value.recur_every, null)
    time_zone            = try(each.value.time_zone, "W. Europe Standard Time")
    duration             = try(each.value.duration, null)
  }
  install_patches = {
    scope  = try(each.value.scope, null)
    reboot = try(each.value.reboot, "Never")
  }
  windows = {
    classifications_to_include = try([each.value.classifications_to_include], null)
    kb_numbers_to_exclude      = try([each.value.kb_numbers_to_exclude], null)
    kb_numbers_to_include      = try([each.value.kb_numbers_to_include], null)
  }
  linux = {
    classifications_to_include    = try([each.value.classifications_to_include])
    package_names_mask_to_exclude = try(each.value.package_names_mask_to_exclude, null)
    package_names_mask_to_include = try(each.value.package_names_mask_to_include, null)
  }
  in_guest_user_patch_mode = try(each.value.in_guest_user_patch_mode, null)
  properties               = try(each.value.properties, null)
  tags                     = try(each.value.tags, null)
}


