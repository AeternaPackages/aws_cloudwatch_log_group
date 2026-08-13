locals {
  cloudwatch_log_groups = { for k1, v1 in var.cloudwatch_log_groups : k1 => { deletion_protection_enabled = v1.deletion_protection_enabled, kms_key_id = v1.kms_key_id, log_group_class = v1.log_group_class, name = v1.name, name_prefix = v1.name_prefix, region = v1.region, retention_in_days = v1.retention_in_days, skip_destroy = v1.skip_destroy, tags = v1.tags, tags_all = v1.tags_all } }

  cloudwatch_log_transformers = merge([
    for k1, v1 in var.cloudwatch_log_groups : {
      for k2, v2 in coalesce(v1.cloudwatch_log_transformers, {}) :
      "${k1}/${k2}" => merge(v2, {
        log_group_arn = module.cloudwatch_log_groups.cloudwatch_log_groups_arn["${k1}"]
      })
    }
  ]...)
}

module "cloudwatch_log_groups" {
  source                = "git::https://github.com/AeternaModules/aws_cloudwatch_log_group.git?ref=v6.58.0"
  cloudwatch_log_groups = local.cloudwatch_log_groups
}

module "cloudwatch_log_transformers" {
  source                      = "git::https://github.com/AeternaModules/aws_cloudwatch_log_transformer.git?ref=v6.58.0"
  cloudwatch_log_transformers = local.cloudwatch_log_transformers
  depends_on                  = [module.cloudwatch_log_groups]
}

