resource "azapi_resource" "aca_env" {
  type      = "Microsoft.App/managedEnvironments@2022-03-01"
  name      = "aca-${var.prefix}-${var.stage}-environment"
  location  = azurerm_resource_group.rg_aca.location
  parent_id = azurerm_resource_group.rg_aca.id
  tags      = local.common_tags

  body = jsonencode({
    properties = {
      appLogsConfiguration : {
        destination : "log-analytics"
        logAnalyticsConfiguration : {
          customerId : azurerm_log_analytics_workspace.law.workspace_id
          sharedKey : azurerm_log_analytics_workspace.law.primary_shared_key
        }
      }
    }
  })
}
