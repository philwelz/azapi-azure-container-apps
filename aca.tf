resource "azapi_resource" "aca_sample" {
  type      = "Microsoft.App/containerApps@2022-01-01-preview"
  name      = "aca-${var.prefix}"
  location  = azurerm_resource_group.rg_aca.location
  parent_id = azurerm_resource_group.rg_aca.id
  tags      = local.common_tags

  body = jsonencode({
    properties = {
      managedEnvironmentId : azapi_resource.aca_env.id
      configuration : {
        ingress : {
          external : true
          targetPort : 8080
        }
      }
      template : {
        containers : [
          {
            image : "ghcr.io/whiteducksoftware/sample-mvc:fred"
            name : "fred"
          }
        ]
        scale : {
          minReplicas : 1
        }
      }
    }
  })
  response_export_values = ["properties.configuration.ingress.fqdn"]
}

# this will output the fqdn
output "fqdn" {
  value = jsondecode(azapi_resource.aca_sample.output).properties.configuration.ingress.fqdn
}
