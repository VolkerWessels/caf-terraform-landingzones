
variable "landing_zones_variables" {
  default = {}
}
# Map of the remote data state
variable "lower_storage_account_name" {
  description = "This value is propulated by the rover"
}
variable "lower_container_name" {
  description = "This value is propulated by the rover"
}
variable "lower_resource_group_name" {
  description = "This value is propulated by the rover"
}

variable "tfstate_subscription_id" {
  description = "This value is propulated by the rover. subscription id hosting the remote tfstates"
}
variable "subscription_id_overrides_by_keys" {
  default     = {}
  description = "Map of subscription_id_overrides_by_keys to reference subscriptions created by CAF module."
}

variable "tfstate_storage_account_name" {
  description = "This value is propulated by the rover"
}
variable "tfstate_container_name" {
  description = "This value is propulated by the rover"
}
variable "tfstate_resource_group_name" {
  description = "This value is propulated by the rover"
}

variable "diagnostics_definition" {
  default = {}
}

variable "landingzone" {
  default = {
    backend_type        = "azurerm"
    global_settings_key = "launchpad"
    level               = "level1"
    key                 = "maintenance_configuration"
    tfstates = {
      launchpad = {
        level   = "lower"
        tfstate = "caf_launchpad.tfstate"
      }
    }
  }
}


variable "user_type" {}
variable "tenant_id" {}
variable "rover_version" {}
variable "logged_user_objectId" {
  default = null
}
variable "tags" {
  type    = map(any)
  default = {}
}

####

variable "resource_group_name" {
  default = {}
}

# variable "azurerm_maintenance_configurations" {
#   default = {}
# }

# variable "azurerm_maintenance_configurations" {
#   type = map(object({
#     name                = string
#     resource_group_name = string
#     location            = string
#     scope               = string
#     visibility          = string
#     window = object({
#       start_date_time      = string
#       expiration_date_time = string
#       recur_every          = string
#       time_zone            = string
#       duration             = string
#     })
#     install_patches = object({
#       windows = object({
#         classifications_to_include = list(string)
#         kb_numbers_to_exclude      = list(string)
#         kb_numbers_to_include      = list(string)
#       })
#       linux = object({
#         classifications_to_include    = list(string)
#         package_names_mask_to_exclude = list(string)
#         package_names_mask_to_include = list(string)
#       })
#       reboot = string
#     })
#     in_guest_user_patch_mode = string
#     properties               = map(string)
#     tags                     = map(string)
#   }))
#   default     = {}
#   description = "A map of Azure Maintenance Configuration objects"
# }

variable "resource_groups" {
  default = {}
}

