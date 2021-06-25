output "ns_record_fqdn" {
  description = "The FQDN."
  value       = aws_route53_record.ns_record.*.fqdn
}

output "route53_zone_id" {
  value = aws_route53_zone.zone.*.zone_id
}

output "route53_zone_name" {
  value = aws_route53_zone.zone.*.name
}

output "a_record_fqdn" {
  value = aws_route53_record.a_record.*.fqdn
}