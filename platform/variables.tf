variable "aws_region" {
  description = "This is the AWS region."
  default     = "eu-central-1"
  type        = "string"
}

variable "aws_profile" {
  description = "This is the AWS profile name as set in the shared credentials file."
  type        = "string"
}

variable "aws_account_id" {
  description = "The allowed account id to provision into."
  type        = "string"
}

variable "app_fullname" {
  description = "The full application name of this terraform configuration stack."
  type        = "string"
}

variable "app_name" {
  description = "The short application name of this terraform configuration stack."
  type        = "string"
}

variable "company_fullname" {
  description = "The full company name of this terraform configuration stack."
  type        = "string"
}

variable "company_name" {
  description = "The short company name of this terraform configuration stack."
  type        = "string"
}

variable "network_address" {
  description = "The cidr address of the network (VPC). Format: X.X.X.X/XX"
  type        = "string"
}

variable "public_subnet_address_pool" {
  description = "The list of possible public subnet cidr network addresses."
  type        = "list"
}

variable "private_subnet_address_pool" {
  description = "The list of possible private subnet cidr network addresses."
  type        = "list"
}

variable "subnet_count" {
  description = "The amount of subnets (public and private) to create."
  type        = "string"
  default     = 2
}

variable "citrix_storefront_instance_type" {
  description = "The ec2 instance type for the storefront servers machines."
  type        = "string"
  default     = "t2.medium"
}

variable "citrix_storefront_instance_volume_size_in_gb" {
  description = "The size of the root volumes of the storefront server machines."
  type        = "string"
  default     = 30
}

variable "citrix_storefront_instance_count" {
  description = "The amount of ec2 instances for the storefront."
  type        = "string"
  default     = 1
}

variable "citrix_storefront_ami_name" {
  description = "The name of the ami to use for citrix storefront servers."
  type        = "string"
}

variable "citrix_storefront_hostname" {
  description = "The hostname which will be set for the storefront server. An ID like 0001+ will be appended to the hostname."
  type        = "string"
}

variable "citrix_ddc_instance_type" {
  description = "The ec2 instance type for the ddc servers machines."
  type        = "string"
  default     = "t2.medium"
}

variable "citrix_ddc_instance_volume_size_in_gb" {
  description = "The size of the root volumes of the ddc server machines."
  type        = "string"
  default     = 30
}

variable "citrix_ddc_instance_count" {
  description = "The amount of ec2 instances for the ddc."
  type        = "string"
  default     = 1
}

variable "citrix_ddc_ami_name" {
  description = "The name of the ami to use for citrix ddc servers."
  type        = "string"
}

variable "citrix_ddc_hostname" {
  description = "The hostname which will be set for the delivery controller. An ID like 0001+ will be appended to the hostname."
  type        = "string"
}

variable "citrix_database_ami_name" {
  description = "The name of the ami to use for citrix database server."
  type        = "string"
}

variable "citrix_database_instance_type" {
  description = "The ec2 instance type for the database server machines."
  type        = "string"
  default     = "t2.medium"
}

variable "citrix_database_instance_volume_size_in_gb" {
  description = "The size of the root volumes of the database server machines."
  type        = "string"
  default     = 30
}

variable "citrix_database_hostname" {
  description = "The hostname which will be set for the database server. An ID like 0001+ will be appended to the hostname."
  type        = "string"
}

variable "ad_domain_name" {
  description = "The active directory domain name where the instances will be joined."
  type        = "string"
}

variable "ad_domain_controller_ip" {
  description = "The active directory domain controller ip."
  type        = "string"
}

variable "ad_domain_admin_username" {
  description = "The active directory domain admin user which will be used to join a server to the domain."
  type        = "string"
}

variable "ad_domain_admin_password" {
  description = "The active directory domain admin user password."
  type        = "string"
}

variable "dsc_pullserver_url" {
  description = "The DSC pullserver url which the DSC configured server will connect to."
  type        = "string"
}

variable "dsc_registration_key" {
  description = "The DSC registration key the DSC configured server need to connect/register to the DSC pullserver"
  type        = "string"
}

variable "domain_name" {
  description = "The route53 hosted zone domain name where the elb instances will be accessable by name."
  type        = "string"
}
