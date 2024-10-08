# AWS provider credentials
variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "access_key" {
  description = "AWS access key"
  type        = string
}

variable "secret_key" {
  description = "AWS secret key"
  type        = string
}

# CloudFront Configuration
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
    locations        = ["US", "CA"]
  }
}

variable "origin" {
  description = "One or more origins for this distribution (multiples allowed)"
  type        = any
  default     = {
    "example-origin-1" = {
      domain_name  = "example-bucket.s3.amazonaws.com"
    }
  }
}

variable "aliases" {
  description = "Extra CNAMEs (alternate domain names), if any, for this distribution"
  type        = list(string)
  default     = null
}

variable "comment" {
  description = "Any comments you want to include about the distribution"
  type        = string
  default     = null
}

variable "create_distribution" {
  description = "Controls if CloudFront distribution should be created"
  type        = bool
  default     = true
}

variable "enabled" {
  description = "Whether the distribution is enabled to accept end user requests for content"
  type        = bool
  default     = true
}

variable "tags" {
  description = "A map of tags to assign to the resource"
  type        = map(string)
  default     = {}
}

variable "viewer_certificate" {
  description = "The SSL configuration for this distribution"
  type        = any
  default     = {
    cloudfront_default_certificate = true
    minimum_protocol_version       = "TLSv1"
  }
}

# Other optional variables
variable "create_monitoring_subscription" {
  description = "If enabled, the resource for monitoring subscription will be created."
  type        = bool
  default     = false
}

variable "logging_config" {
  description = "The logging configuration for CloudFront distribution"
  type        = any
  default     = {}
}

variable "web_acl_id" {
  description = "If using AWS WAF, the Web ACL ID associated with the distribution"
  type        = string
  default     = null
}
