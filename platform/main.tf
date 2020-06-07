locals {
  name_prefix = "${var.company_name}-${var.app_name}"
  environment = "${terraform.workspace}"

  default_tags = {
    Company     = "${var.company_fullname}"
    Application = "${var.app_fullname}"
    Environment = "${terraform.workspace}"
    Terraform   = "True"
  }
}

terraform {
  backend "s3" {
    bucket         = "risc-infraxo-terraform-state-dev"
    key            = "state"
    dynamodb_table = "risc-infraxo-state-lock-dev"

    region  = "eu-central-1"
    profile = "terraform-demolab"
  }
}
