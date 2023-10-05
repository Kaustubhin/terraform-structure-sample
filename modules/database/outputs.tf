output "id" {
  description = "The ID of the PostgreSQL Server."
  value       = azurerm_postgresql_server.psqlsrv.id
}

output "fqdn" {
  description = "The fqdn of the PostgreSQL Server."
  value       = azurerm_postgresql_server.psqlsrv.fqdn
}