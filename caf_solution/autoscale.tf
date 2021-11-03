module "monitor_autoscale_setting" {
  source = "git::https://github.com/VolkerWessels/terraform-azurerm-caf.git//monitoring/monitor_autoscale_setting?ref=feature/monitor-autoscale-setting"
  version = "~>5.4.0"

  depends_on = [module.solution]

  for_each = {
    for key, value in try(var.monitor_autoscale_setting, {}) : key => value
    if try(value.profile, null) != null
  }

  default_region = module.solution.default_region
  monitor_autoscale_setting = var.monitor_autoscale_setting
}
