
# Create a rule for each outbound IP address on the lemmy backend app
resource "azurerm_postgresql_flexible_server_firewall_rule" "lemmy_app" {
  for_each = var.source_ips

  name             = "rule-${each.value}"
  server_id        = var.postgres_server_id
  start_ip_address = each.value
  end_ip_address   = each.value
}
