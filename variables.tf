variable "cloudwatch_log_groups" {
  description = <<EOT
Map of cloudwatch_log_groups, attributes below
Optional:
    - deletion_protection_enabled
    - kms_key_id
    - log_group_class
    - name
    - name_prefix
    - region
    - retention_in_days
    - skip_destroy
    - tags
    - tags_all
Nested cloudwatch_log_transformers (aws_cloudwatch_log_transformer):
    Optional:
        - region
        - transformer_config (block)
EOT

  type = map(object({
    deletion_protection_enabled = optional(bool)
    kms_key_id                  = optional(string)
    log_group_class             = optional(string)
    name                        = optional(string)
    name_prefix                 = optional(string)
    region                      = optional(string)
    retention_in_days           = optional(number)
    skip_destroy                = optional(bool)
    tags                        = optional(map(string))
    tags_all                    = optional(map(string))
    cloudwatch_log_transformers = optional(map(object({
      region = optional(string)
      transformer_config = optional(list(object({
        add_keys = optional(list(object({
          entry = optional(list(object({
            key                 = string
            overwrite_if_exists = optional(bool)
            value               = string
          })))
        })))
        copy_value = optional(list(object({
          entry = optional(list(object({
            overwrite_if_exists = optional(bool)
            source              = string
            target              = string
          })))
        })))
        csv = optional(list(object({
          columns         = optional(list(string))
          delimiter       = optional(string)
          quote_character = optional(string)
          source          = optional(string)
        })))
        date_time_converter = optional(list(object({
          locale          = optional(string)
          match_patterns  = list(string)
          source          = string
          source_timezone = optional(string)
          target          = string
          target_format   = optional(string)
          target_timezone = optional(string)
        })))
        delete_keys = optional(list(object({
          with_keys = list(string)
        })))
        grok = optional(list(object({
          match  = string
          source = optional(string)
        })))
        list_to_map = optional(list(object({
          flatten           = optional(bool)
          flattened_element = optional(string)
          key               = string
          source            = string
          target            = optional(string)
          value_key         = optional(string)
        })))
        lower_case_string = optional(list(object({
          with_keys = list(string)
        })))
        move_keys = optional(list(object({
          entry = optional(list(object({
            overwrite_if_exists = optional(bool)
            source              = string
            target              = string
          })))
        })))
        parse_cloudfront = optional(list(object({
          source = optional(string)
        })))
        parse_json = optional(list(object({
          destination = optional(string)
          source      = optional(string)
        })))
        parse_key_value = optional(list(object({
          destination         = optional(string)
          field_delimiter     = optional(string)
          key_prefix          = optional(string)
          key_value_delimiter = optional(string)
          non_match_value     = optional(string)
          overwrite_if_exists = optional(bool)
          source              = optional(string)
        })))
        parse_postgres = optional(list(object({
          source = optional(string)
        })))
        parse_route53 = optional(list(object({
          source = optional(string)
        })))
        parse_to_ocsf = optional(list(object({
          event_source = string
          ocsf_version = string
          source       = optional(string)
        })))
        parse_vpc = optional(list(object({
          source = optional(string)
        })))
        parse_waf = optional(list(object({
          source = optional(string)
        })))
        rename_keys = optional(list(object({
          entry = optional(list(object({
            key                 = string
            overwrite_if_exists = optional(bool)
            rename_to           = string
          })))
        })))
        split_string = optional(list(object({
          entry = optional(list(object({
            delimiter = string
            source    = string
          })))
        })))
        substitute_string = optional(list(object({
          entry = optional(list(object({
            from   = string
            source = string
            to     = string
          })))
        })))
        trim_string = optional(list(object({
          with_keys = list(string)
        })))
        type_converter = optional(list(object({
          entry = optional(list(object({
            key  = string
            type = string
          })))
        })))
        upper_case_string = optional(list(object({
          with_keys = list(string)
        })))
      })))
    })))
  }))

  validation {
    condition = alltrue(concat(
      [for kk in keys(var.cloudwatch_log_groups) : !strcontains(kk, "/")],
      flatten([for k0, v0 in var.cloudwatch_log_groups : [for kk in keys(coalesce(v0.cloudwatch_log_transformers, {})) : !strcontains(kk, "/")]])
    ))
    error_message = "Map keys in this package must not contain '/': it is used internally as a nesting-key separator, so a key containing it can silently collide two different nested entries into one. Rename the offending key(s)."
  }
}
