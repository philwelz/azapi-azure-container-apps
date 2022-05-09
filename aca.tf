
resource "azapi_resource" "aca_sample" {
  type      = "Microsoft.App/containerApps@2022-03-01"
  name      = "aca-${var.prefix}-${var.stage}"
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
            image : var.container_image
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
