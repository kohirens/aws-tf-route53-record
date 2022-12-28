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
      zone_id         = "Z13DS3D233VBWESS327R4"
      alias           = {
        evaluate_target_health = false
        regional_domain_name   = "terraform.example.com.s3.us-east-2.amazon.com"
        zone_id                = "Z1LKDWSF3892S0WWS"
      }
    },
  ]
}
