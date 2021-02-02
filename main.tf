data "azurerm_client_config" "main" {}

data "azurerm_role_definition" "main" {
  count = var.role != "" ? 1 : 0
  name  = var.role
}

data "azurerm_subscription" "main" {}

resource "azuread_application" "main" {
  display_name = var.name
  identifier_uris = [
    format("http://%s", var.name)
  ]
  available_to_other_tenants = false
}

resource "azuread_service_principal" "main" {
  application_id = azuread_application.main.application_id
}

resource "time_rotating" "main" {
  rotation_rfc3339 = var.end_date
  rotation_years   = var.years

  triggers = {
    end_date = var.end_date
    years    = var.years
  }
}

resource "random_password" "main" {
  count  = var.password == "" ? 1 : 0
  length = 32

  keepers = {
    rfc3339 = time_rotating.main.id
  }
}

resource "azuread_service_principal_password" "main" {
  count                = var.password != null ? 1 : 0
  service_principal_id = azuread_service_principal.main.id
  value                = coalesce(var.password, random_password.main[0].result)
  end_date             = time_rotating.main.rotation_rfc3339
}

resource "azurerm_role_assignment" "main" {
  count              = var.role != "" ? length(local.scopes) : 0
  scope              = local.scopes[count.index]
  role_definition_id = format("%s%s", data.azurerm_subscription.main.id, data.azurerm_role_definition.main[0].id)
  principal_id       = azuread_service_principal.main.id
}
