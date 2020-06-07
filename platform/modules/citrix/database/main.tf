# Database server instance

data "aws_ami" "citrix_database_image" {
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

resource "aws_instance" "citrix_database_server" {
  count = "1" //"${var.instance_count}"

  ami           = "${data.aws_ami.citrix_database_image.id}"
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
  $CitrixServerType = "Database"
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

  tags = "${merge(var.tags, map("Name", "${var.name_prefix}-citrix-db-${count.index + 1}-${var.environment}"))}"
}

resource "aws_security_group" "instance" {
  name   = "${var.name_prefix}-database-instance-${var.environment}"
  vpc_id = "${var.vpc_id}"

  # Allow MySQL Port
  ingress {
    from_port   = 1433
    to_port     = 1433
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

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
