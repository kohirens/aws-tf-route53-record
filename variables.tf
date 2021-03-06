variable "aws_region" {
  description = "AWS region."
  type        = string
}

variable "alias_evaluate_target_health" {
  description = "Evaluate the health of the alis. Required if record type is \"A\"."
  type        = bool
  default     = true
}

variable "alias_regional_domain_name" {
  description = "The regional domain name for the alias. Required if record type is \"A\"."
  type        = string
  default     = null
}

variable "alias_zone_id" {
  description = "Hosted zone ID for a CloudFront distribution, S3 bucket, ELB, or Route 53 hosted zone. Required if record type is \"A\"."
  type        = string
  default     = null
}

variable "domain_name" {
  description = "The domain name, for example: test.example.com."
  type        = string
}

variable "ns_records" {
  description = "A list of NS records. Required if record type is \"NS\"."
  type        = list(string)
  default     = null
}

variable "type" {
  description = "Record type."
  type        = string
}

variable "zone_id" {
  default     = null
  description = "A Route 53 hosted zone ID. Required for records types such as \"A\" and \"NS\""
  type        = string
}
