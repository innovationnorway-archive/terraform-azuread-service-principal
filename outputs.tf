output "name" {
  value       = azuread_service_principal.main.display_name
  description = "The display name of the Azure AD application."
}

output "application_id" {
  value       = azuread_application.main.application_id
  description = "The client (application) ID of the service principal."
}

output "client_id" {
  value       = azuread_application.main.application_id
  description = "Echoes the `application_id` output value, for convenience if passing the result of this module elsewhere as an object."
}

output "object_id" {
  value       = azuread_service_principal.main.id
  description = "The Object ID of the service principal."
}

output "tenant_id" {
  value       = data.azurerm_client_config.main.tenant_id
  description = "Echoes back the tenant (directory) ID, for convenience if passing the result of this module elsewhere as an object."
}

output "password" {
  value       = azuread_service_principal_password.main[0].value
  sensitive   = true
  description = "The password for the service principal."
}

output "client_secret" {
  value       = azuread_service_principal_password.main[0].value
  sensitive   = true
  description = "Echoes the `password` output value, for convenience if passing the result of this module elsewhere as an object."
}
