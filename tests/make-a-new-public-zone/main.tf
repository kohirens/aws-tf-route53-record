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
  public_zones = [
    {
      allow_overwrite   = false
      comment           = "Manage By Terraform test"
      delegation_set_id = ""
      domain_name       = "terraform.kohirens.com"
      force_destroy     = true
    },
  ]
}

module "records" {
  source = "../.."

  depends_on = [
    module.main
  ]

  aws_region  = local.aws_region
  records = [
    {
      zone_id         = module.main.public_hosted_zones[0].zone_id
      allow_overwrite = false
      name            = "terraform-test"
      ttl             = 60
      type            = "TXT"
      value           = ["TerraformTest"]
    },
  ]
}

resource "test_assertions" "a_new_zone_was_made" {
  component = "a_new_zone_was_made"

  check "hosted_zone" {
    description = "assert hosted zone was made"
    condition   = can(regex("^[A-Z0-9]{10,32}", module.main.public_hosted_zones[0].zone_id))
  }

  equal "txt_record" {
    description = "assert TXT record was made"
    got         = module.records.records[0].fqdn
    want        = "terraform-test.${module.main.public_hosted_zones[0].name}"
  }
}
