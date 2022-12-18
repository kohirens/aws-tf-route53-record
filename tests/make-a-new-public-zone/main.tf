terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }

    http = {
      source = "hashicorp/http"
    }
    aws = {
      source  = "hashicorp/aws"
      version = ">=3.40.0, <5.0.0"
    }
  }
}

locals {
  aws_region = "us-west-1"
}

provider "aws" {
  region = local.aws_region
}

module "main" {
  source      = "../.."
  aws_region  = local.aws_region
  domain_name = null # required until they are removed in the next major release
  type        = null # required until they are removed in the next major release
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

module "records" {
  source = "../.."

  depends_on = [
    module.main
  ]

  aws_region  = local.aws_region
  domain_name = null # required until they are removed in the next major release
  type        = null # required until they are removed in the next major release
  records = [
    {
      zone_id         = module.main.public_hosted_zones[0].zone_id
      allow_overwrite = false
      name            = "terraform-test"
      ttl             = null
      type            = "TXT"
      value           = ["TerraformTest"]
    },
  ]
}

resource "test_assertions" "a_new_zone_was_made" {
  component = "a_new_zone_was_made"

  equal "scheme" {
    description = "assert hosted zone was made"
    got         = module.main.public_hosted_zones[0].name
    want        = "terraform.kohirens.com"
  }

  equal "txt_record" {
    description = "assert TXT record was made"
    got         = module.records.records[0].zone_id
    want        = module.main.public_hosted_zones[0].zone_id
  }
}
