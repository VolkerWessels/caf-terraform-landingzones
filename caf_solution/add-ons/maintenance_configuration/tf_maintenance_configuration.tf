resource "azurerm_maintenance_configuration" "mc" {
  for_each = try(var.azurerm_maintenance_configurations, {})

  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  location   = try(each.value.location)
  scope      = try(each.value.scope)
  visibility = try(each.value.visibility, null)
  window {
    start_date_time      = try(each.value.window.start_date_time, null)
    expiration_date_time = try(each.value.window.expiration_date_time, null)
    recur_every          = try(each.value.window.recur_every, null)
    time_zone            = try(each.value.window.time_zone, "W. Europe Standard Time")
    duration             = try(each.value.window.duration, null)
  }
  dynamic "install_patches" {
    for_each = try(each.value.install_patches, null) == null ? [] : [1]
    content {
      windows {
        classifications_to_include = try(each.value.install_patches.windows.classifications_to_include, null)
        kb_numbers_to_exclude      = try(each.value.install_patches.windows.kb_numbers_to_exclude, null)
        kb_numbers_to_include      = try(each.value.install_patches.windows.kb_numbers_to_include, null)
      }
      linux {
        classifications_to_include    = try(each.value.install_patches.linux.classifications_to_include, null)
        package_names_mask_to_exclude = try(each.value.install_patches.linux.package_names_mask_to_exclude, null)
        package_names_mask_to_include = try(each.value.install_patches.linux.package_names_mask_to_include, null)
      }
      reboot = try(each.value.install_patches.reboot, null)
    }
    dynamic "in_guest_user_patch_mode" {
      for_each = try(each.value.in_guest_user_patch_mode, null) == null ? [] : [1]
      content {
        in_guest_user_patch_mode = try(each.value.in_guest_user_patch_mode, null)
      }
    }

    # in_guest_user_patch_mode = try(each.value.in_guest_user_patch_mode, null)
    properties               = try(each.value.properties, null)
    tags                     = try(each.value.tags, null)
  }
}


