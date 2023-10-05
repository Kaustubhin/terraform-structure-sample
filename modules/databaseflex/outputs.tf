output "id" {
  description = "The ID of the PostgreSQL Server."
  value       = azurerm_postgresql_flexible_server.flexpsqlsrv.id
}

output "fqdn" {
  description = "The fqdn of the PostgreSQL Server."
  value       = azurerm_postgresql_flexible_server.flexpsqlsrv.fqdn
}