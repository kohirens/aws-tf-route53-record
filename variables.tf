variable "aws_region" {
  description = "AWS region."
  type        = string
}

# obsolete, will be removed in the next major release.
variable "alias_evaluate_target_health" {
  description = "Obsolete, see a_records variable. Evaluate the health of the alis. Required if record type is \"A\"."
  type        = bool
  default     = true
}

# obsolete, will be removed in the next major release.
variable "alias_regional_domain_name" {
  description = "Obsolete, see a_records variable. The regional domain name for the alias. Required if record type is \"A\"."
  type        = string
  default     = null
}

# obsolete, will be removed in the next major release.
variable "alias_zone_id" {
  description = "Obsolete, see a_records variable. Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone. Required if record type is \"A\"."
  type        = string
  default     = null
}

# obsolete, will be removed in the next major release.
variable "domain_name" {
  description = "Obsolete see a_records, ns_recs, and etc. The domain name, for example: test.example.com."
  type        = string
}

# obsolete, will be removed in the next major release.
variable "ns_records" {
  description = "Obsolete, use `ns_recs`. A list of NS records. Required if record type is \"NS\"."
  type        = list(string)
  default     = null
}

# obsolete, will be removed in the next major release.
variable "ns_ttl" {
  default     = 172800
  description = "Obsolete, use `ns_recs`. Time to live in seconds."
  type        = number
}

# obsolete, will be removed in the next major release.
variable "type" {
  description = "Obsolete, see `ns_recs` or `a_records` and etc. Record type."
  type        = string
}

# obsolete, will be removed in the next major release.
variable "zone_id" {
  default     = null
  description = "Obsolete see a_records, ns_recs, and etc. A Route 53 hosted zone ID. Required for records types such as \"A\" and \"NS\""
  type        = string
}

variable "a_records" {
  default     = null
  description = "A list of AWS alias (A) records to add to a hosted zone."
  type = list(object({
    allow_overwrite = bool
    domain_name     = string
    type            = string
    zone_id         = string
    alias = object({
      evaluate_target_health = bool
      regional_domain_name   = string
      zone_id                = string
    })
  }))
}

# Will be renamed to `ns_records` in the next major release.
variable "ns_recs" {
  default     = null
  description = "A list of name server (NS) records to add to a hosted zone."
  type = list(object({
    allow_overwrite = bool
    domain_name     = string
    name_servers    = list(string)
    zone_id         = string
    ttl             = number
  }))
}

variable "public_zones" {
  default     = null
  description = "A list of public hosed zones to make."
  type = list(object({
    allow_overwrite   = bool
    comment           = string
    delegation_set_id = string
    domain_name       = string
    force_destroy     = bool
  }))
}

variable "private_zones" {
  default     = null
  description = "A list of private hosed zones to make."
  type = list(object({
    allow_overwrite = bool
    comment         = string
    domain_name     = string
    vpc             = string
    force_destroy   = bool
  }))
}

variable "records" {
  default     = null
  description = "A list of records like CNAME, TXT, MX, etc."
  type = list(object({
    allow_overwrite = bool
    name            = string
    ttl             = number
    type            = string
    value           = set(string)
    zone_id         = string
  }))
}
