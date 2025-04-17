resource "azurerm_cdn_frontdoor_firewall_policy" "example" {
  name                = var.waf_policy_name
  resource_group_name = var.resource_group_name

  custom_rule {
    name     = var.rule_name
    priority = 1
    action   = "Block"
    match_conditions {
      match_variable = "RemoteAddr"
      operator       = "IPMatch"
      match_values   = [var.block_ip]
    }
  }

  dynamic "custom_rule" {
    for_each = azurerm_cdn_frontdoor_firewall_policy.example.custom_rule
    content {
      name     = custom_rule.value.name
      priority = custom_rule.value.priority
      action   = custom_rule.value.action

      match_conditions {
        match_variable = custom_rule.value.match_conditions.match_variable
        operator       = custom_rule.value.match_conditions.operator
        match_values   = custom_rule.value.match_conditions.match_values
      }
    }
  }
}
