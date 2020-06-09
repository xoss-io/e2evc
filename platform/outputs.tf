
output "ec2_instances" {
  value = aws_instance.ec2[*]
}

output "dns" {
  value = {
    lb_ddc = aws_route53_record.lb_record_ddc.fqdn
    lb_stf = aws_route53_record.lb_record_stf.fqdn
  }
}

output  "admin_user"{
  value = {
    username = local.administrative_user_to_create
    password = random_password.ec2_installer.result
  }
}