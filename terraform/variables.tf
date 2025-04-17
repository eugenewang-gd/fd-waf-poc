variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
  default     = "Eugene-POC"
}

variable "waf_policy_name" {
  description = "The name of the WAF policy"
  type        = string
  default     = "WAFPOC"
}

variable "rule_name" {
  description = "The name of the custom rule to update"
  type        = string
  default     = "Blacklist"
}

variable "block_ip" {
  description = "The IP address to block"
  type        = string
  default     = "1.1.1.1"
}
