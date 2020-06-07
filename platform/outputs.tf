output "vpc_id" {
  description = "The id of the created vpc."
  value       = "${module.vpc.vpc_id}"
}

output "vpc_public_subnet_ids" {
  description = "The public subnet ids of the created vpc."
  value       = "${module.vpc.public_subnets}"
}

output "vpc_private_subnet_ids" {
  description = "The private subnet ids of the created vpc."
  value       = "${module.vpc.private_subnets}"
}

output "citrix_storefront_loadbalancer_dns_name" {
  description = "The public accessable dns name of the loadbalancer."
  value       = "http://${module.citrix_storefront_cluster.loadbalancer_dns_name}"
}

output "citrix_storefront_loadbalancer_arn" {
  description = "The id/arn of the loadbalancer."
  value       = "${module.citrix_storefront_cluster.loadbalancer_arn}"
}

output "citrix_ddc_loadbalancer_dns_name" {
  description = "The public accessable dns name of the loadbalancer."
  value       = "http://${module.citrix_delivery_controller_cluster.loadbalancer_dns_name}"
}

output "citrix_ddc_loadbalancer_arn" {
  description = "The id/arn of the loadbalancer."
  value       = "${module.citrix_delivery_controller_cluster.loadbalancer_arn}"
}
