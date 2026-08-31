# --- aws_cloudwatch_log_group ---
output "cloudwatch_log_groups_id" {
  description = "Map of id values across all cloudwatch_log_groups, keyed the same as var.cloudwatch_log_groups"
  value       = module.cloudwatch_log_groups.cloudwatch_log_groups_id
}

output "cloudwatch_log_groups_arn" {
  description = "Map of arn values across all cloudwatch_log_groups, keyed the same as var.cloudwatch_log_groups"
  value       = module.cloudwatch_log_groups.cloudwatch_log_groups_arn
}

output "cloudwatch_log_groups_deletion_protection_enabled" {
  description = "Map of deletion_protection_enabled values across all cloudwatch_log_groups, keyed the same as var.cloudwatch_log_groups"
  value       = module.cloudwatch_log_groups.cloudwatch_log_groups_deletion_protection_enabled
}

output "cloudwatch_log_groups_kms_key_id" {
  description = "Map of kms_key_id values across all cloudwatch_log_groups, keyed the same as var.cloudwatch_log_groups"
  value       = module.cloudwatch_log_groups.cloudwatch_log_groups_kms_key_id
}

output "cloudwatch_log_groups_log_group_class" {
  description = "Map of log_group_class values across all cloudwatch_log_groups, keyed the same as var.cloudwatch_log_groups"
  value       = module.cloudwatch_log_groups.cloudwatch_log_groups_log_group_class
}

output "cloudwatch_log_groups_name" {
  description = "Map of name values across all cloudwatch_log_groups, keyed the same as var.cloudwatch_log_groups"
  value       = module.cloudwatch_log_groups.cloudwatch_log_groups_name
}

output "cloudwatch_log_groups_name_prefix" {
  description = "Map of name_prefix values across all cloudwatch_log_groups, keyed the same as var.cloudwatch_log_groups"
  value       = module.cloudwatch_log_groups.cloudwatch_log_groups_name_prefix
}

output "cloudwatch_log_groups_region" {
  description = "Map of region values across all cloudwatch_log_groups, keyed the same as var.cloudwatch_log_groups"
  value       = module.cloudwatch_log_groups.cloudwatch_log_groups_region
}

output "cloudwatch_log_groups_retention_in_days" {
  description = "Map of retention_in_days values across all cloudwatch_log_groups, keyed the same as var.cloudwatch_log_groups"
  value       = module.cloudwatch_log_groups.cloudwatch_log_groups_retention_in_days
}

output "cloudwatch_log_groups_skip_destroy" {
  description = "Map of skip_destroy values across all cloudwatch_log_groups, keyed the same as var.cloudwatch_log_groups"
  value       = module.cloudwatch_log_groups.cloudwatch_log_groups_skip_destroy
}

output "cloudwatch_log_groups_tags" {
  description = "Map of tags values across all cloudwatch_log_groups, keyed the same as var.cloudwatch_log_groups"
  value       = module.cloudwatch_log_groups.cloudwatch_log_groups_tags
}

output "cloudwatch_log_groups_tags_all" {
  description = "Map of tags_all values across all cloudwatch_log_groups, keyed the same as var.cloudwatch_log_groups"
  value       = module.cloudwatch_log_groups.cloudwatch_log_groups_tags_all
}

# --- aws_cloudwatch_log_transformer ---
output "cloudwatch_log_transformers_log_group_arn" {
  description = "Map of log_group_arn values across all cloudwatch_log_transformers, keyed the same as var.cloudwatch_log_transformers"
  value       = module.cloudwatch_log_transformers.cloudwatch_log_transformers_log_group_arn
}

output "cloudwatch_log_transformers_region" {
  description = "Map of region values across all cloudwatch_log_transformers, keyed the same as var.cloudwatch_log_transformers"
  value       = module.cloudwatch_log_transformers.cloudwatch_log_transformers_region
}

output "cloudwatch_log_transformers_transformer_config" {
  description = "Map of transformer_config values across all cloudwatch_log_transformers, keyed the same as var.cloudwatch_log_transformers"
  value       = module.cloudwatch_log_transformers.cloudwatch_log_transformers_transformer_config
}


