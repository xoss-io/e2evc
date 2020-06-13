provider "aws" {
  region = "eu-central-1"
}

terraform {
  backend "s3" {
    bucket = "ctx-poc-terraform"
    key = "ctx_poc.tf"
    region = "eu-central-1"
  }
}
provider "aws" {
  alias   = "dev_account"
  assume_role {
    role_arn = "arn:aws:iam::577306381903:role/allow_route_53_update"
  }
  region  = "eu-central-1"
}
provider "aws" {
  alias   = "shared_account"
  assume_role {
    role_arn = "arn:aws:iam::136691220971:role/acm_remote"
  }
  region  = "eu-central-1"
}

data "aws_route53_zone" "default" {
  name     = local.dns_suffix
  provider = aws.dev_account
}

data "aws_vpc" "default" {
  filter {
    name   = "isDefault"
    values = ["true"]
  }
}
data "aws_subnet_ids" "default" {
  vpc_id = data.aws_vpc.default.id
}

data aws_instance "domaincontroller" {
  instance_id = "i-0711b4585c17e2364"
}


data "aws_ami" "ami_win_srv2k19" {
  most_recent = true
  owners      = ["801119661308"]

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }
}


resource "random_password" "ec2_installer" {
  length = 32
  number = true
  special = false
  lower = true
  upper = true
}

data template_file "userdata" {
  count    = length(local.vms)
  template = file("./assets/init.tpl")
  vars = {
    hostname = local.vms[count.index].hostname
    username = local.administrative_user_to_create
    password = random_password.ec2_installer.result
  }
}


data template_file "dsc_configuration" {
  count    = length(local.vms)
  template = file("./assets/dsc.tpl")
  vars = {
    configuration = local.vms[count.index].configuration
  }
}

data template_file "vda_userdata" {
  count    = local.vdas.count
  template = file("./assets/init.tpl")
  vars = {
    hostname = format("${local.vdas.prefix}-%02s", count.index + 1)
    username = local.administrative_user_to_create
    password = random_password.ec2_installer.result
  }
}


data template_file "vda_dsc_configuration" {
  template = file("./assets/dsc.tpl")
  vars = {
    configuration = local.vdas.configuration
  }
}

data aws_acm_certificate "wildcard" {
  domain = local.certificate
  provider = aws.shared_account
}