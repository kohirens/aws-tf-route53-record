output "a_records" {
  description = "Private hosted zones"
  value = [for i, v in aws_route53_record.a_records : {
    alias   = v.alias
    name    = v.name
    zone_id = v.zone_id
  }]
}

output "ns_records" {
  description = "Private hosted zones"
  value = [for i, v in aws_route53_record.ns_records : {
    name    = v.name
    zone_id = v.zone_id
  }]
}

output "private_hosted_zones" {
  description = "Private hosted zones"
  value = [for i, v in aws_route53_zone.private_zones : {
    arn               = v.arn
    name              = v.name
    name_servers      = v.name_servers
    zone_id           = v.zone_id
    delegation_set_id = v.delegation_set_id
  }]
}

output "public_hosted_zones" {
  description = "Public hosted zones"
  value = [for i, v in aws_route53_zone.public_zones : {
    arn          = v.arn
    name         = v.name
    name_servers = v.name_servers
    zone_id      = v.zone_id
    vpc          = v.vpc
  }]
}

output "records" {
  description = "Records added"
  value = [for i, v in aws_route53_record.records : {
    fqdn    = v.fqdn
    name    = v.name
    type    = v.type
    zone_id = v.zone_id
    value   = toset(v.records)
  }]
}
