resource "azurerm_frontdoor_firewall_policy" "example" {
  name                = var.waf_policy_name
  resource_group_name = var.resource_group_name

  custom_rule {
    name     = var.rule_name
    priority = 1
    rule_type = "MatchRule"
    action   = "Block"

    match_condition {
      match_variable = "RemoteAddr"
      operator       = "IPMatch"
      negate_condition = false
      match_values   = [var.block_ip]
    }
  }

  dynamic "custom_rule" {
    for_each = azurerm_frontdoor_firewall_policy.example.custom_rule
    content {
      name     = custom_rule.value.name
      priority = custom_rule.value.priority
      rule_type = custom_rule.value.rule_type
      action   = custom_rule.value.action

      match_condition {
        match_variable = custom_rule.value.match_condition.match_variable
        operator       = custom_rule.value.match_condition.operator
        negate_condition = custom_rule.value.match_condition.negate_condition
        match_values   = custom_rule.value.match_condition.match_values
      }
    }
  }
}