# obsolete, will be removed in the next major release.
resource "aws_route53_zone" "zone" {
  count = var.type == "zone" ? 1 : 0
  name  = var.domain_name
}

# obsolete, will be removed in the next major release.
resource "aws_route53_record" "ns_record" {
  count           = var.type == "NS" ? 1 : 0
  allow_overwrite = true
  name            = var.domain_name
  type            = "NS"
  records         = var.ns_records
  ttl             = var.ns_ttl
  zone_id         = var.zone_id
}

# obsolete, will be removed in the next major release.
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

resource "aws_route53_record" "a_records" {
  count           = var.a_records == null ? 0 : length(var.a_records)
  allow_overwrite = var.a_records[count.index].allow_overwrite
  name            = var.a_records[count.index].domain_name
  type            = "A"
  zone_id         = var.a_records[count.index].zone_id

  alias {
    evaluate_target_health = var.a_records[count.index].alias.evaluate_target_health
    name                   = var.a_records[count.index].alias.regional_domain_name
    zone_id                = var.a_records[count.index].alias.zone_id
  }
}

resource "aws_route53_record" "ns_records" {
  count           = var.ns_recs == null ? 0 : length(var.ns_recs)
  allow_overwrite = var.ns_recs[count.index].allow_overwrite
  name            = var.ns_recs[count.index].domain_name
  records         = var.ns_recs[count.index].name_servers
  ttl             = var.ns_recs[count.index].ttl
  type            = "NS"
  zone_id         = var.ns_recs[count.index].zone_id
}

resource "aws_route53_zone" "private_zones" {
  count         = var.private_zones == null ? 0 : length(var.private_zones)
  comment       = var.private_zones[count.index].comment
  name          = var.private_zones[count.index].domain_name
  force_destroy = var.private_zones[count.index].force_destroy

  vpc {
    vpc_id = var.private_zones[count.index].vpc
  }
}

resource "aws_route53_zone" "public_zones" {
  count             = var.public_zones == null ? 0 : length(var.public_zones)
  comment           = var.public_zones[count.index].comment
  delegation_set_id = var.public_zones[count.index].delegation_set_id
  force_destroy     = var.public_zones[count.index].force_destroy
  name              = var.public_zones[count.index].domain_name
}

resource "aws_route53_record" "records" {
  count           = var.records == null ? 0 : length(var.records)
  allow_overwrite = var.records[count.index].allow_overwrite
  name            = var.records[count.index].name
  ttl             = var.records[count.index].ttl
  type            = var.records[count.index].type
  records         = var.records[count.index].value
  zone_id         = var.records[count.index].zone_id
}
