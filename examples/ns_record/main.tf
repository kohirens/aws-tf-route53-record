terraform {
  required_version = ">=1.0.0, <2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=4.48.0, <5.0.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "main" {
  source     = ".."
  aws_region = var.aws_region
  ns_records = [
    {
      allow_overwrite = false
      domain_name     = "terraform.example.com"
      name_servers    = [
        "abc.exampledns-03.org.",
        "def141.exampledns-17.com.",
        "ns-123.exampledns-55.net.",
        "ns-456.exampledns-07.co.uk.",
      ]
      zone_id         = "Z00000001H1ABCDGH0123" # example.com hosted zone.
      ttl             = 172800
    },
  ]
}
