terraform {
  required_version = ">=1.0.0, <2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.40.0, <5.0.0"
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
      domain_name       = "terraform.kohirens.com"
      allow_overwrite   = false
      comment           = "Manage By Terraform test"
      delegation_set_id = null
      force_destroy     = false
    },
  ]
}