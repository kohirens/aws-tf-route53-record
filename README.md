# AWS Route 53 Record Terraform Module

## Status

[![CircleCI](https://dl.circleci.com/status-badge/img/gh/kohirens/aws-tf-route53-record/tree/main.svg?style=svg)](https://dl.circleci.com/status-badge/redirect/gh/kohirens/aws-tf-route53-record/tree/main)

## Resources

The following Route 53 resources can be made:

* A record
* CNAME record
* Hosted zone
* MX record
* NS record
* TXT record

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=4.48.0, <5.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.48.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_route53_record.a_records](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.ns_records](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_record.records](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_route53_zone.private_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |
| [aws_route53_zone.public_zones](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_zone) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_a_records"></a> [a\_records](#input\_a\_records) | A list of AWS alias (A) records to add to a hosted zone. | <pre>list(object({<br>    allow_overwrite = bool<br>    domain_name     = string<br>    zone_id         = string<br>    alias = object({<br>      evaluate_target_health = bool<br>      regional_domain_name   = string<br>      zone_id                = string<br>    })<br>  }))</pre> | `null` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | AWS region. | `string` | n/a | yes |
| <a name="input_ns_records"></a> [ns\_records](#input\_ns\_records) | A list of name server (NS) records to add to a hosted zone. | <pre>list(object({<br>    allow_overwrite = bool<br>    domain_name     = string<br>    name_servers    = list(string)<br>    zone_id         = string<br>    ttl             = number<br>  }))</pre> | `null` | no |
| <a name="input_private_zones"></a> [private\_zones](#input\_private\_zones) | A list of private hosed zones to make. | <pre>list(object({<br>    allow_overwrite = bool<br>    comment         = string<br>    domain_name     = string<br>    vpc             = string<br>    force_destroy   = bool<br>  }))</pre> | `null` | no |
| <a name="input_public_zones"></a> [public\_zones](#input\_public\_zones) | A list of public hosed zones to make. | <pre>list(object({<br>    allow_overwrite   = bool<br>    comment           = string<br>    delegation_set_id = string<br>    domain_name       = string<br>    force_destroy     = bool<br>  }))</pre> | `null` | no |
| <a name="input_records"></a> [records](#input\_records) | A list of records like CNAME, TXT, MX, etc. | <pre>list(object({<br>    allow_overwrite = bool<br>    name            = string<br>    ttl             = number<br>    type            = string<br>    value           = set(string)<br>    zone_id         = string<br>  }))</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_a_records"></a> [a\_records](#output\_a\_records) | Private hosted zones |
| <a name="output_ns_records"></a> [ns\_records](#output\_ns\_records) | Private hosted zones |
| <a name="output_private_hosted_zones"></a> [private\_hosted\_zones](#output\_private\_hosted\_zones) | Private hosted zones |
| <a name="output_public_hosted_zones"></a> [public\_hosted\_zones](#output\_public\_hosted\_zones) | Public hosted zones |
| <a name="output_records"></a> [records](#output\_records) | Records added |
<!-- END_TF_DOCS -->
