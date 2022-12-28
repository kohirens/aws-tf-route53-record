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
      name            = "@"
      value           = [
        "exmaplemail-verification=0f000ebeb0b0de00000c0bdfa00cb0fb0c0000aa",
      ]
      type            = "TXT"
      zone_id         = "Z02FVCDSCC0C2ES099JCEW"
      ttl             = 60
    },
  ]
}
