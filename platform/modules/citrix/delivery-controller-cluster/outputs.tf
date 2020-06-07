output "loadbalancer_arn" {
  description = "The ARN of the created loadbalancer."
  value       = "${module.citrix_ddc_alb.load_balancer_id}"
}

output "loadbalancer_dns_name" {
  description = "The public accessable dns name of the loadbalancer."
  value       = "${module.citrix_ddc_alb.dns_name}"
}

output "url" {
  description = "The url for accessing the cluster."
  value       = "https://${aws_route53_record.ddc_alb.fqdn}"
}
