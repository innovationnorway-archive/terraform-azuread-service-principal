provider "azurerm" {
  features {}
}

resource "random_id" "test" {
  byte_length = 4
}

module "service_principal" {
  source = "../"

  name = format("%s-%s", var.name_prefix, random_id.test.hex)

  end_date = "1W"

  role = "Contributor"
}

data "azuread_application" "test" {
  name = module.service_principal.name
}

output "service_principal" {
  value = module.service_principal
}

output "application" {
  value = data.azuread_application.test
}
