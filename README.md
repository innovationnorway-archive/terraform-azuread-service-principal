# Azure AD Service Principal

![validate-test](https://github.com/innovationnorway/terraform-azuread-service-principal/workflows/validate-test/badge.svg)

Create a service principal and configure it's access to Azure resources.

> ⚠️ **Warning**: This module will happily expose service principal credentials. All arguments including the service principal password will be persisted into Terraform state, into any plan files, and in some cases in the console output while running `terraform plan` and `terraform apply`. Read more about [sensitive data in state](https://www.terraform.io/docs/state/sensitive-data.html).

## Example Usage

### Basic example

```hcl
module "service_principal" {
  source   = "innovationnorway/service-principal/azuread"
  name     = "example"
  years    = 2
}
```

### Configure access to Azure resources

```hcl
resource "azurerm_resource_group" "example" {
  name     = "example-resources"
  location = "westeurope"
}

module "service_principal" {
  source = "innovationnorway/service-principal/azuread"
  name   = "example"
  role   = "Contributor"
  scopes = [azurerm_resource_group.example.id]
}
```

## Arguments

| Name | Type | Description |
| --- | --- | --- |
| `name` | `string` | **Required.** The name of the service principal. |
| `password` | `string` | A password for the service principal. If missing, Terraform will generate a password. |
| `end_date` | `string` | The date after which the password expire. This should be UTC [RFC3339 time string](https://tools.ietf.org/html/rfc3339#section-5.8) (`YYYY-MM-DDTHH:MM:SSZ`). |
| `years` | `number` | The number of years after which the password expire. Either this or `end_date` should be specified, but not both. Default: `1`. |
| `role` | `string` | The name of a [built-in](https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles) or custom role for the service principal. |
| `scopes` | `list` | List of scopes the `role` assignment applies to. |
