variable "aws_account_id" {
  description = "The current/target aws account id where the resources will created."
  type        = "string"
  default     = ""
}

variable "environment" {
  description = "The name of the environment the resources belong to."
  type        = "string"
}

variable "name_prefix" {
  description = "A prefix which will be prepended to each resource name. Example: company-app1"
  type        = "string"
}

variable "tags" {
  description = "A collection of tags to attach to the resources."
  type        = "map"
  default     = {}
}

variable "vpc_id" {
  description = "The id of the vpc where the resources will be created in."
  type        = "string"
}

variable "public_subnet_ids" {
  description = "A list of existent public subnets where the loadbalancer will be attached to."
  type        = "list"
}

variable "private_subnet_ids" {
  description = "A list of existent private subnets where the instances will be attached to."
  type        = "list"
}

/*
variable "instance_count" {
  description = "The amount of instances to create in the cluster."
  type        = "string"
  default     = "2"
}
*/

variable "instance_type" {
  description = "The ec2 instance type for the server machines."
  type        = "string"
}

variable "instance_volume_size_in_gb" {
  description = "The size of the root volumes of the server machines."
  type        = "string"
}

variable "instance_image_name" {
  description = "The name of the ami to use for citrix servers."
  type        = "string"
}

variable "instance_hostname" {
  description = "The hostname which will be set for the server machines. An id will be appended 1 to instance_count."
  type        = "string"
}

variable "dsc_configuration_name" {
  description = "The DSC configuration name which should be attached to the server server."
  type        = "string"
  default     = ""
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

variable "domain_zone_id" {
  description = "The route53 hosted zone domain id where the dns record will be created."
  type        = "string"
}

variable "active_directory_domain_name" {
  description = "The active directory domain name where the instances will be joined."
  type        = "string"
}

variable "active_directory_domain_controller_ip" {
  description = "The active directory domain controller ip."
  type        = "string"
}

variable "active_directory_domain_admin_username" {
  description = "The active directory domain admin user which will be used to join a server to the domain."
  type        = "string"
}

variable "active_directory_domain_admin_password" {
  description = "The active directory domain admin user password."
  type        = "string"
}
