module "monitor_autoscale_setting" {
  source = "github.com/VolkerWessels/terraform-azurerm-caf//modules/monitoring/monitor_autoscale_setting?ref=monitor-autoscale-setting"

  depends_on = [module.solution]

  for_each = {
    for key, value in try(var.monitor_autoscale_setting, {}) : key => value
    if try(value.profile, null) != null
  }

  monitor_autoscale_setting = var.monitor_autoscale_setting
}
