resource "azurerm_frontdoor_firewall_policy" "example" {
  name                = var.waf_policy_name
  resource_group_name = var.resource_group_name

  custom_rule {
    name     = var.rule_name
    priority = 1
    action   = "Block"
    rule_type = "MatchRule"  # Add the required type argument

    match_condition {
      match_variable = "RemoteAddr"
      operator       = "IPMatch"
      match_values   = [var.block_ip]
    }
  }

  dynamic "custom_rule" {
    for_each = azurerm_frontdoor_firewall_policy.example.custom_rule
    content {
      name     = custom_rule.value.name
      priority = custom_rule.value.priority
      action   = custom_rule.value.action
      rule_type = custom_rule.value.rule_type  # Add the required type argument

      match_condition {
        match_variable = custom_rule.value.match_condition.match_variable
        operator       = custom_rule.value.match_condition.operator
        match_values   = custom_rule.value.match_condition.match_values
      }
    }
  }
}