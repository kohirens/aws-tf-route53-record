resource "aws_route53_record" "ns_record" {
  count           = var.type == "NS" ? 1 : 0
  allow_overwrite = true
  name            = var.domain_name
  type            = "NS"
  records         = var.ns_records
  ttl             = 172800
  zone_id         = var.zone_id
}

resource "aws_route53_record" "a_record" {
  count           = var.type == "A" ? 1 : 0
  allow_overwrite = true
  name            = var.domain_name
  type            = "A"
  zone_id         = var.zone_id

  alias {
    evaluate_target_health = var.alias_evaluate_target_health
    name                   = var.alias_regional_domain_name
    zone_id                = var.alias_zone_id
  }
}