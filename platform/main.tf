provider "aws" {
  profile = "ctx_poc_terraform"

  region = "eu-central-1"
}

provider "aws" {
  profile = "dev_terraform"
  alias   = "dev_account"
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
  instance_id = "i-0c48798e8cc3332c5"
}
# Lookup the correct AMI based on the region specified
data "aws_ami" "ami_win_srv2k19" {
  most_recent = true
  owners      = ["801119661308"]

  filter {
    name   = "name"
    values = ["Windows_Server-2019-English-Full-Base-*"]
  }
}


resource "random_password" "ec2_installer" {
  length = 16
  number = true
  special = true
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







