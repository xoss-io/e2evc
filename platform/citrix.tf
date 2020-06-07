module "citrix_storefront_cluster" {
  source = "./modules/citrix/storefront-cluster"

  instance_count             = "${var.citrix_storefront_instance_count}"
  instance_type              = "${var.citrix_storefront_instance_type}"
  instance_image_name        = "${var.citrix_storefront_ami_name}"
  instance_volume_size_in_gb = "${var.citrix_storefront_instance_volume_size_in_gb}"
  instance_hostname          = "${var.citrix_storefront_hostname}"

  domain_name    = "${var.domain_name}"
  domain_zone_id = "${aws_route53_zone.infraxo_domain.zone_id}"

  active_directory_domain_name           = "${var.ad_domain_name}"
  active_directory_domain_controller_ip  = "${var.ad_domain_controller_ip}"
  active_directory_domain_admin_username = "${var.ad_domain_admin_username}"
  active_directory_domain_admin_password = "${var.ad_domain_admin_password}"

  dsc_configuration_name = ""                            // The configuration name will be generated automatically by the user data script
  dsc_pullserver_url     = "${var.dsc_pullserver_url}"
  dsc_registration_key   = "${var.dsc_registration_key}"

  vpc_id             = "${module.vpc.vpc_id}"
  public_subnet_ids  = "${module.vpc.public_subnets}"
  private_subnet_ids = "${module.vpc.private_subnets}"

  name_prefix    = "${local.name_prefix}"
  environment    = "${local.environment}"
  aws_account_id = "${var.aws_account_id}"

  tags = "${local.default_tags}"
}

module "citrix_delivery_controller_cluster" {
  source = "./modules/citrix/delivery-controller-cluster"

  instance_count             = "${var.citrix_ddc_instance_count}"
  instance_type              = "${var.citrix_ddc_instance_type}"
  instance_image_name        = "${var.citrix_ddc_ami_name}"
  instance_volume_size_in_gb = "${var.citrix_ddc_instance_volume_size_in_gb}"
  instance_hostname          = "${var.citrix_ddc_hostname}"

  domain_name    = "${var.domain_name}"
  domain_zone_id = "${aws_route53_zone.infraxo_domain.zone_id}"

  active_directory_domain_name           = "${var.ad_domain_name}"
  active_directory_domain_controller_ip  = "${var.ad_domain_controller_ip}"
  active_directory_domain_admin_username = "${var.ad_domain_admin_username}"
  active_directory_domain_admin_password = "${var.ad_domain_admin_password}"

  dsc_configuration_name = ""                            // The configuration name will be generated automatically by the user data script
  dsc_pullserver_url     = "${var.dsc_pullserver_url}"
  dsc_registration_key   = "${var.dsc_registration_key}"

  vpc_id             = "${module.vpc.vpc_id}"
  public_subnet_ids  = "${module.vpc.public_subnets}"
  private_subnet_ids = "${module.vpc.private_subnets}"

  name_prefix    = "${local.name_prefix}"
  environment    = "${local.environment}"
  aws_account_id = "${var.aws_account_id}"

  tags = "${local.default_tags}"
}

locals {
  ddc_dns_names = [
    "${var.citrix_ddc_hostname}0001.${var.ad_domain_name}",
    "${var.citrix_ddc_hostname}0002.${var.ad_domain_name}",
    "${var.citrix_ddc_hostname}0003.${var.ad_domain_name}",
    "${var.citrix_ddc_hostname}0004.${var.ad_domain_name}",
  ]
}

module "citrix_delivery_agent_cluster" {
  source = "./modules/citrix/delivery-agent-cluster"

  instance_count             = "${var.citrix_ddc_instance_count}"
  instance_type              = "t2.medium"                                    //"${var.citrix_ddc_instance_type}"
  instance_image_name        = "${var.citrix_ddc_ami_name}" // This is a dummy which uses the same image like the ddc. Here we need the image which install the vda previosly called: "Windows_SRV2K19_VDA" (packer_build: w2k19_vda.json)
  instance_volume_size_in_gb = "${var.citrix_ddc_instance_volume_size_in_gb}"
  instance_hostname          = "DEMOWWS"

  delivery_controller_dns_names = "${slice(local.ddc_dns_names, 0, var.citrix_ddc_instance_count)}"

  domain_name    = "${var.domain_name}"
  domain_zone_id = "${aws_route53_zone.infraxo_domain.zone_id}"

  active_directory_domain_name           = "${var.ad_domain_name}"
  active_directory_domain_controller_ip  = "${var.ad_domain_controller_ip}"
  active_directory_domain_admin_username = "${var.ad_domain_admin_username}"
  active_directory_domain_admin_password = "${var.ad_domain_admin_password}"

  dsc_configuration_name = "VDA_SRV2K16"
  dsc_pullserver_url     = "${var.dsc_pullserver_url}"
  dsc_registration_key   = "${var.dsc_registration_key}"

  vpc_id             = "${module.vpc.vpc_id}"
  public_subnet_ids  = "${module.vpc.public_subnets}"
  private_subnet_ids = "${module.vpc.private_subnets}"

  name_prefix    = "${local.name_prefix}"
  environment    = "${local.environment}"
  aws_account_id = "${var.aws_account_id}"

  tags = "${local.default_tags}"
}

module "citrix_database" {
  source = "./modules/citrix/database"

  //instance_count             = "${var.citrix_database_instance_count}"
  instance_type              = "${var.citrix_database_instance_type}"
  instance_image_name        = "${var.citrix_database_ami_name}"
  instance_volume_size_in_gb = "${var.citrix_database_instance_volume_size_in_gb}"
  instance_hostname          = "${var.citrix_database_hostname}"

  domain_name    = "${var.domain_name}"
  domain_zone_id = "${aws_route53_zone.infraxo_domain.zone_id}"

  active_directory_domain_name           = "${var.ad_domain_name}"
  active_directory_domain_controller_ip  = "${var.ad_domain_controller_ip}"
  active_directory_domain_admin_username = "${var.ad_domain_admin_username}"
  active_directory_domain_admin_password = "${var.ad_domain_admin_password}"

  dsc_configuration_name = "MS_SQL_2016"
  dsc_pullserver_url     = "${var.dsc_pullserver_url}"
  dsc_registration_key   = "${var.dsc_registration_key}"

  vpc_id             = "${module.vpc.vpc_id}"
  public_subnet_ids  = "${module.vpc.public_subnets}"
  private_subnet_ids = "${module.vpc.private_subnets}"

  name_prefix    = "${local.name_prefix}"
  environment    = "${local.environment}"
  aws_account_id = "${var.aws_account_id}"

  tags = "${local.default_tags}"
}
