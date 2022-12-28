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
  public_zones = [
    {
      domain_name       = "terraform.example.com"
      allow_overwrite   = false
      comment           = "Manage By Terraform"
      delegation_set_id = ""
      force_destroy     = false
    },
  ]
}
