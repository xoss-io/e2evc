data "aws_availability_zones" "all" {}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws" // https://registry.terraform.io/modules/terraform-aws-modules/
  version = "1.71.0"

  name = "${local.name_prefix}-citrix-vpc-${local.environment}"
  cidr = "${var.network_address}"

  azs             = ["${slice(data.aws_availability_zones.all.names, 0, var.subnet_count)}"] // 0 = "eu-central-1a", 1= "eu-central-1b", 2 = "eu-central-1c"]
  public_subnets  = ["${slice(var.public_subnet_address_pool, 0, var.subnet_count)}"]
  private_subnets = ["${slice(var.private_subnet_address_pool, 0, var.subnet_count)}"]

  enable_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  enable_dhcp_options              = true
  dhcp_options_domain_name         = "${var.ad_domain_name}"
  dhcp_options_domain_name_servers = ["${var.ad_domain_controller_ip}"]

  tags = "${local.default_tags}"
}

data "aws_vpcs" "default" {
  filter {
    name   = "isDefault"
    values = ["true"]
  }
}

data "aws_vpc" "acceptor" {
  id = "${element(data.aws_vpcs.default.ids, 0)}"
}

# Lookup acceptor subnets
data "aws_subnet_ids" "acceptor" {
  //count  = "${var.enabled == "true" ? 1 : 0}"
  vpc_id = "${data.aws_vpc.acceptor.id}"
}

# Lookup acceptor route tables
data "aws_route_table" "acceptor" {
  //count     = "${length(distinct(sort(data.aws_subnet_ids.acceptor.ids)))}"
  //subnet_id = "${element(distinct(sort(data.aws_subnet_ids.acceptor.ids)), 0)}"
  vpc_id = "${data.aws_vpc.acceptor.id}"
}

resource "aws_vpc_peering_connection" "citrix_vpc_to_default_vpc" {
  vpc_id        = "${module.vpc.vpc_id}"
  peer_vpc_id   = "${data.aws_vpc.acceptor.id}"
  peer_owner_id = "${var.aws_account_id}"
  peer_region   = "${var.aws_region}"

  tags = "${merge(local.default_tags, map("Name", "citrix-vpc-to-default-vpc"), map("Type", "Requester"))}"
}

resource "aws_vpc_peering_connection_accepter" "citrix_vpc_to_default_vpc" {
  vpc_peering_connection_id = "${aws_vpc_peering_connection.citrix_vpc_to_default_vpc.id}"
  auto_accept               = true
  tags                      = "${merge(local.default_tags, map("Name", "citrix-vpc-to-default-vpc"), map("Type", "Accepter"))}"

  lifecycle {
    ignore_changes = ["tags"]
  }
}

resource "aws_vpc_peering_connection_options" "citrix_vpc_to_default_vpc_options" {
  vpc_peering_connection_id = "${aws_vpc_peering_connection_accepter.citrix_vpc_to_default_vpc.id}"

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}

resource "aws_route" "citrix_vpc_to_default_vpc_peering_routes" {
  // Per default the vpc module creates for private subnets for each subnet one route table and for public subnets only one route table 
  count = "${var.subnet_count + 1}"

  route_table_id            = "${element(distinct(sort(concat(module.vpc.private_route_table_ids, module.vpc.public_route_table_ids))), count.index)}"
  destination_cidr_block    = "${data.aws_vpc.acceptor.cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.citrix_vpc_to_default_vpc.id}"
}

resource "aws_route" "default_vpc_to_citrix_vpc_peering_routes" {
  count                     = "${length(distinct(data.aws_route_table.acceptor.*.route_table_id))}"
  route_table_id            = "${element(distinct(data.aws_route_table.acceptor.*.route_table_id), count.index)}"
  destination_cidr_block    = "${module.vpc.vpc_cidr_block}"
  vpc_peering_connection_id = "${aws_vpc_peering_connection.citrix_vpc_to_default_vpc.id}"
}
