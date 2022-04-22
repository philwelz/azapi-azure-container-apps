################################
### Log Analytics Workspace ####
################################

# Create Log Analytics Workspace
resource "azurerm_log_analytics_workspace" "law" {
  name                = "law-${var.prefix}"
  location            = azurerm_resource_group.rg_aca.location
  resource_group_name = azurerm_resource_group.rg_aca.name
  sku                 = "PerGB2018"
  retention_in_days   = "30"
  daily_quota_gb      = "-1"
  tags                = local.common_tags
}
