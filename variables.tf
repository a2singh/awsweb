variable "region" {
  description = "AWS Region"
}

variable "access_key" {
  description = "AWS Access Key"
}

variable "secret_key" {
  description = "AWS Secret Key"
}

variable "default_cache_behavior" {
  description = "The default cache behavior for this distribution"
  type        = any
  default     = {
    target_origin_id       = "example-origin-1"
    viewer_protocol_policy = "redirect-to-https"
  }
}

variable "geo_restriction" {
  description = "The restriction configuration for this distribution (geo_restrictions)"
  type        = any
  default     = {
    restriction_type = "whitelist"
    locations = ["US", "CA"]
  }
}

variable "origin" {
  description = "One or more origins for this distribution (multiples allowed)."
  type        = any
  default     = {
    "example-origin-1" = {
      domain_name  = "example-bucket.s3.amazonaws.com"
    }
  }
}

variable "aliases" {
  description = "Extra CNAMEs (alternate domain names), if any, for this distribution."
  type        = list(string)
  default     = null
}

variable "comment" {
  description = "Any comments you want to include about the distribution."
  type        = string
  default     = null
}

variable "create_distribution" {
  description = "Controls if CloudFront distribution should be created"
  type        = bool
  default     = true
}

variable "create_monitoring_subscription" {
  description = "If enabled, the resource for monitoring subscription will created."
  type        = bool
  default     = false
}

variable "create_origin_access_control" {
  description = "Controls if CloudFront origin access control should be created"
  type        = bool
  default     = false
}

variable "create_origin_access_identity" {
  description = "Controls if CloudFront origin access identity should be created"
  type        = bool
  default     = false
}

variable "custom_error_response" {
  description = "One or more custom error response elements"
  type        = any
  default     = {}
}

variable "default_root_object" {
  description = "The object that you want CloudFront to return when an end user requests the root URL."
  type        = string
  default     = null
}

variable "enabled" {
  description = "Whether the distribution is enabled to accept end user requests for content."
  type        = bool
  default     = true
}

variable "http_version" {
  description = "The maximum HTTP version to support on the distribution."
  type        = string
  default     = "http2"
}

variable "is_ipv6_enabled" {
  description = "Whether the IPv6 is enabled for the distribution."
  type        = bool
  default     = null
}

variable "logging_config" {
  description = "The logging configuration that controls how logs are written to your distribution."
  type        = any
  default     = {}
}

variable "origin_access_control" {
  description = "Map of CloudFront origin access control"
  type = map(object({
    description      = string
    origin_type      = string
    signing_behavior = string
    signing_protocol = string
  }))
  default = {
    s3 = {
      description      = "S3 buck",
      origin_type      = "s3",
      signing_behavior = "always",
      signing_protocol = "sigv4"
    }
  }
}

variable "origin_access_identities" {
  description = "Map of CloudFront origin access identities"
  type        = map(string)
  default     = {
    "example-identity" = "My CloudFront Origin Access Identity"
  }
}

variable "origin_group" {
  description = "One or more origin_group for this distribution."
  type        = any
  default     = {}
}

variable "ordered_cache_behavior" {
  description = "An ordered list of cache behaviors resource for this distribution."
  type        = any
  default     = []
}

variable "price_class" {
  description = "The price class for this distribution."
  type        = string
  default     = null
}

variable "realtime_metrics_subscription_status" {
  description = "Indicates whether additional CloudWatch metrics are enabled for a given CloudFront distribution."
  type        = string
  default     = "Enabled"
}

variable "retain_on_delete" {
  description = "Disables the distribution instead of deleting it when destroying."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = null
}

variable "viewer_certificate" {
  description = "The SSL configuration for this distribution"
  type        = any
  default     = {
    cloudfront_default_certificate = true
    minimum_protocol_version       = "TLSv1"
  }
}

variable "wait_for_deployment" {
  description = "If enabled, the resource will wait for the distribution status to change from InProgress to Deployed."
  type        = bool
  default     = true
}

variable "web_acl_id" {
  description = "The Id of the AWS WAF web ACL associated with the distribution."
  type        = string
  default     = null
}

locals {
  create_origin_access_identity = var.create_origin_access_identity && length(keys(var.origin_access_identities)) > 0
  create_origin_access_control  = var.create_origin_access_control && length(keys(var.origin_access_control)) > 0
}
