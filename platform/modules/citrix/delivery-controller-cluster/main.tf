# Delivery Controller Loadbalancer with domain record and certificate
module "citrix_ddc_alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "3.6.0"

  load_balancer_name = "${var.name_prefix}-citrix-ddc-lb-${var.environment}"

  vpc_id          = "${var.vpc_id}"
  subnets         = ["${var.public_subnet_ids}"]
  security_groups = ["${aws_security_group.loadbalancer.id}"]

  logging_enabled = false

  /*
                      https_listeners       = "${list(map("certificate_arn", "${aws_acm_certificate.ddc_alb_certificate.arn}", "port", 443, "protocol", "HTTPS", "target_group_index", 1))}" // / Should get the validated cert arn when it works again: aws_acm_certificate_validation.ddc_alb_certificate_validation.certificate_arn
                      https_listeners_count = "1"
                    */
  http_tcp_listeners = "${list(map("port", "80", "protocol", "HTTP", "target_group_index", 0))}"

  http_tcp_listeners_count = "1"

  target_groups       = "${list(map("name", "${var.name_prefix}-ddc-tg-http-${var.environment}", "backend_protocol", "HTTP", "backend_port", "80"))}" //map("name", "${var.name_prefix}-ddc-tg-https-${var.environment}", "backend_protocol", "HTTP", "backend_port", "80")
  target_groups_count = "1"                                                                                                                           // 2 with https
  tags                = "${var.tags}"
}

resource "aws_lb_target_group_attachment" "citrix_ddc_server_alb_http_attachment" {
  count = "${var.instance_count}"

  target_group_arn = "${element(module.citrix_ddc_alb.target_group_arns, 0)}"
  target_id        = "${element(aws_instance.citrix_ddc_server.*.id, count.index)}"
  port             = 80
}

/*
resource "aws_lb_target_group_attachment" "citrix_ddc_server_alb_https_attachment" {
  count = "${var.instance_count}"

  target_group_arn = "${element(module.citrix_ddc_alb.target_group_arns, 1)}"
  target_id        = "${element(aws_instance.citrix_ddc_server.*.id, count.index)}"
  port             = 80
}
*/

resource "aws_route53_record" "ddc_alb" {
  zone_id = "${var.domain_zone_id}"
  name    = "deliverycontroller.${var.domain_name}"
  type    = "A"

  alias {
    name                   = "${module.citrix_ddc_alb.dns_name}"
    zone_id                = "${module.citrix_ddc_alb.load_balancer_zone_id}"
    evaluate_target_health = false
  }
}

/*
resource "aws_acm_certificate" "ddc_alb_certificate" {
  domain_name = "deliverycontroller.${var.domain_name}" //aws_route53_record" "ddc_alb => fqdn

  //subject_alternative_names = ["${var.subject_alternative_names}"]
  validation_method = "DNS"
  tags              = "${merge(map("Name", "deliverycontroller.${var.domain_name}"), var.tags)}"
}

resource "aws_route53_record" "ddc_alb_certificate_validation_records" {
  count = "${length(list()) + 1}"

  zone_id = "${var.domain_zone_id}"

  name            = "${lookup(aws_acm_certificate.ddc_alb_certificate.domain_validation_options[count.index], "resource_record_name")}"
  type            = "${lookup(aws_acm_certificate.ddc_alb_certificate.domain_validation_options[count.index], "resource_record_type")}"
  records         = ["${lookup(aws_acm_certificate.ddc_alb_certificate.domain_validation_options[count.index], "resource_record_value")}"]
  ttl             = "60"
  allow_overwrite = true
}

resource "aws_acm_certificate_validation" "ddc_alb_certificate_validation" {
  certificate_arn = "${aws_acm_certificate.ddc_alb_certificate.arn}"

  validation_record_fqdns = [
    "${aws_route53_record.ddc_alb_certificate_validation_records.*.fqdn}",
  ]

  timeouts {
    create = "5m"
  }
}

*/

# Delivery Controller server instance

data "aws_ami" "citrix_ddc_image" {
  most_recent = true

  filter {
    name   = "name"
    values = ["${var.instance_image_name}*"]
  }

  owners = ["${var.aws_account_id}"] # Canonical
}

module "scripts" {
  source = "../../../modules/windows/scripts"
}

resource "aws_instance" "citrix_ddc_server" {
  count = "${var.instance_count}"

  ami           = "${data.aws_ami.citrix_ddc_image.id}"
  instance_type = "${var.instance_type}"

  vpc_security_group_ids = ["${aws_security_group.instance.id}"]
  subnet_id              = "${element(var.private_subnet_ids, count.index)}"

  associate_public_ip_address = true

  root_block_device = [
    {
      volume_size = "${var.instance_volume_size_in_gb}"
      volume_type = "gp2"
    },
  ]

  user_data = <<EOF
<powershell>
 
  # Parameters
  $TargetHostname = "${var.instance_hostname}"
  $HostID = ${count.index + 1}
  $CitrixServerType = "Delivery_Controller"
  $TargetConfigurationName = "${var.dsc_configuration_name}"

  $DscPullserverUrl = "${var.dsc_pullserver_url}"
  $DscRegistrationKey = "${var.dsc_registration_key}"

  $DomainName ="${var.active_directory_domain_name}"
  $DomainControllerIP = "${var.active_directory_domain_controller_ip}"
  $DomainAdminUser ="${var.active_directory_domain_admin_username}"
  $DomainAdminUserPassword ="${var.active_directory_domain_admin_password}"


  # Write script files to filesystem

  $joinDomainScriptContent = @'
  ${module.scripts.join_domain}
'@

  $joinDomainScriptContent | Out-File ".\Join-Domain.ps1"

  $initDscConfigurationScriptContent = @' 
  ${module.scripts.init_dsc_configuration}
'@

  $initDscConfigurationScriptContent | Out-File ".\Init-DscConfiguration.ps1"

  $lcmDefaultConfiguration = @' 
  ${module.scripts.dsc_lcm_configuration}
'@

  $lcmDefaultConfiguration | Out-File ".\LCMDefault.ps1"

  $initCitrixServerScriptContent = @' 
  ${module.scripts.init_citrix_server}
'@

  $initCitrixServerScriptContent | Out-File ".\Init-CitrixServer.ps1"

  .\Init-CitrixServer.ps1 -DscConfigName $TargetConfigurationName -CitrixServerType $CitrixServerType -HostName $TargetHostName -HostID $HostID -DomainName $DomainName -DomainAdminUser $DomainAdminUser -DomainAdminUserPassword $DomainAdminUserPassword -DomainControllerIP $DomainControllerIP -DscPullserverUrl $DscPullserverUrl -DscRegistrationKey $DscRegistrationKey

</powershell>
<persist>true</persist>
EOF

  tags = "${merge(var.tags, map("Name", "${var.name_prefix}-citrix-controller-${count.index + 1}-${var.environment}"))}"
}

resource "aws_security_group" "loadbalancer" {
  name   = "${var.name_prefix}-ddc-loadbalancer-${var.environment}"
  vpc_id = "${var.vpc_id}"

  # Allow inbound HTTP requests
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound HTTPS requests
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all outbound requests
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "instance" {
  name   = "${var.name_prefix}-ddc-instance-${var.environment}"
  vpc_id = "${var.vpc_id}"

  # Allow inbound HTTP requests
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow inbound HTTPS requests
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow RDP Port
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow WinrM - HTTP Port
  ingress {
    from_port   = 5985
    to_port     = 5985
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow WinrM - HTTPS Port
  ingress {
    from_port   = 5986
    to_port     = 5986
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ## Domain Controller ports for member server
  #### Allow inbound DNS requests
  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "tcp"
    cidr_blocks = ["${var.active_directory_domain_controller_ip}/32"]
  }

  #### Allow inbound DNS requests
  ingress {
    from_port   = 53
    to_port     = 53
    protocol    = "udp"
    cidr_blocks = ["${var.active_directory_domain_controller_ip}/32"]
  }

  #### Allow inbound RPC dynamic ports
  ingress {
    from_port   = 49152
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["${var.active_directory_domain_controller_ip}/32"]
  }

  #### Allow inbound RPC dynamic ports
  ingress {
    from_port   = 49152
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["${var.active_directory_domain_controller_ip}/32"]
  }

  #### Allow inbound Kerberos requests
  ingress {
    from_port   = 88
    to_port     = 88
    protocol    = "tcp"
    cidr_blocks = ["${var.active_directory_domain_controller_ip}/32"]
  }

  #### Allow inbound Kerberos requests
  ingress {
    from_port   = 88
    to_port     = 88
    protocol    = "udp"
    cidr_blocks = ["${var.active_directory_domain_controller_ip}/32"]
  }

  #### Allow inbound SMB over IP
  ingress {
    from_port   = 445
    to_port     = 445
    protocol    = "tcp"
    cidr_blocks = ["${var.active_directory_domain_controller_ip}/32"]
  }

  #### Allow inbound SMB over IP
  ingress {
    from_port   = 445
    to_port     = 445
    protocol    = "udp"
    cidr_blocks = ["${var.active_directory_domain_controller_ip}/32"]
  }

  #### Allow inbound LDAP
  ingress {
    from_port   = 389
    to_port     = 389
    protocol    = "tcp"
    cidr_blocks = ["${var.active_directory_domain_controller_ip}/32"]
  }

  #### Allow inbound LDAP
  ingress {
    from_port   = 389
    to_port     = 389
    protocol    = "udp"
    cidr_blocks = ["${var.active_directory_domain_controller_ip}/32"]
  }

  #### Allow inbound LDAP over SSL
  ingress {
    from_port   = 636
    to_port     = 636
    protocol    = "tcp"
    cidr_blocks = ["${var.active_directory_domain_controller_ip}/32"]
  }

  #### Allow inbound LDAP over SSL
  ingress {
    from_port   = 636
    to_port     = 636
    protocol    = "udp"
    cidr_blocks = ["${var.active_directory_domain_controller_ip}/32"]
  }

  # Allow all outbound requests
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
