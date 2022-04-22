# azapi-azure-container-apps

This repository contains Terraform code to deploy a sample Azure Container Apps with the [Azure AzApi](https://registry.terraform.io/providers/Azure/azapi/latest/docs) provider.

## Requirements

* Terrafrom 1.1.7

## Authentication

Terraform supports a number of different methods for authenticating to Azure. Please chek the options [here](https://registry.terraform.io/providers/azure/azapi/latest/docs#authenticating-to-azure).

## Deploy

```bash
# Initialize the Terraform environment
terraform init
# Execute the Terraform plan
terraform plan
# Apply the Terraform plan
terrafrom apply
# Destroy the Terraform environment
terraform destroy
```
