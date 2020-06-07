output "join_domain" {
  description = "The script to join a domain."
  value       = "${data.template_file.join_domain_ps1.rendered}"
}

output "init_citrix_server" {
  description = "The script to initialize a citrix server (storefront, contorller, agent)."
  value       = "${data.template_file.init_citrix_server_ps1.rendered}"
}

output "init_dsc_configuration" {
  description = "The script to initialize dsc on a server."
  value       = "${data.template_file.init_dsc_configuration_ps1.rendered}"
}

output "dsc_lcm_configuration" {
  description = "The dsc configuration to set the DSC LCM."
  value       = "${data.template_file.dsc_lcm_configuration_ps1.rendered}"
}
