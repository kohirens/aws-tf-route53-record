output "route53_ns_record_fdqn" {
  description = "The FQDN."
  value       = aws_route53_record.ns_record[0].fqdn
}
