variable "aws_region" {
  description = "AWS region."
  type        = string
}

variable "a_records" {
  default     = null
  description = "A list of AWS alias (A) records to add to a hosted zone."
  type = list(object({
    allow_overwrite = bool
    domain_name     = string
    zone_id         = string
    alias = object({
      evaluate_target_health = bool
      regional_domain_name   = string
      zone_id                = string
    })
  }))
}

# Will be renamed to `ns_records` in the next major release.
variable "ns_records" {
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
