resource "azurerm_maintenance_configuration" "mc" {
  for_each = try(var.azurerm_maintenance_configurations, {})

  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  location   = try(each.value.location)
  scope      = try(each.value.scope, null)
  visibility = try(each.value.visibility, null)
  window = {
    start_date_time      = try(each.value.window.start_date_time, null)
    expiration_date_time = try(each.value.window.expiration_date_time, null)
    recur_every          = try(each.value.window.recur_every, null)
    time_zone            = try(each.value.window.time_zone, "W. Europe Standard Time")
    duration             = try(each.value.window.duration, null)
  }
  install_patches = {
    scope  = try(each.value.install_patches.scope, null)
    reboot = try(each.value.install_patches.reboot, "Never")
  }
  windows = {
    classifications_to_include = try([each.value.windows.classifications_to_include], null)
    kb_numbers_to_exclude      = try([each.value.windows.kb_numbers_to_exclude], null)
    kb_numbers_to_include      = try([each.value.windows.kb_numbers_to_include], null)
  }
  linux = {
    classifications_to_include    = try([each.value.linux.classifications_to_include])
    package_names_mask_to_exclude = try(each.value.linux.package_names_mask_to_exclude, null)
    package_names_mask_to_include = try(each.value.linux.package_names_mask_to_include, null)
  }
  in_guest_user_patch_mode = try(each.value.in_guest_user_patch_mode, null)
  properties               = try(each.value.properties, null)
  tags                     = try(each.value.tags, null)
}


