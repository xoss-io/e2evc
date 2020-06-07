data "template_file" "join_domain_ps1" {
  template = "${file("${path.module}/files/domain/Join-Domain.ps1")}"
  vars     = {}
}

data "template_file" "init_dsc_configuration_ps1" {
  template = "${file("${path.module}/files/dsc/Init-DscConfiguration.ps1")}"
  vars     = {}
}

data "template_file" "dsc_lcm_configuration_ps1" {
  template = "${file("${path.module}/files/dsc/LCMDefault.ps1")}"
  vars     = {}
}

data "template_file" "init_citrix_server_ps1" {
  template = "${file("${path.module}/files/citrix/Init-CitrixServer.ps1")}"

  vars = {}
}
