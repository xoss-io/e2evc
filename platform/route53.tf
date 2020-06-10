resource "aws_route53_zone" "demo_e2evc" {
  name = local.subdomain_fqdn
}

resource "aws_route53_record" "delegation" {
  name     = local.subdomain
  type     = "NS"
  zone_id  = data.aws_route53_zone.default.id
  ttl      = 360
  records  = aws_route53_zone.demo_e2evc.name_servers
  provider = aws.dev_account
}

//resource "aws_route53_zone" "demo_internal" {
//  name = local.subdomain_fqdn
//  vpc {
//    vpc_id     = data.aws_vpc.default.id
//    vpc_region = "eu-central-1"
//  }
//}

//resource "aws_route53_record" "ec2_records" {
//  count   = length(local.vms)
//  name    = local.vms[count.index].hostname
//  type    = "A"
//  ttl     = 360
//  zone_id = aws_route53_zone.demo_internal.id
//  records = [aws_instance.ec2[count.index].private_ip]
//}

resource "aws_route53_record" "lb_record_stf" {
  name = "storefront"

  type    = "CNAME"
  zone_id = aws_route53_zone.demo_e2evc.id
  records = [aws_elb.lb_stf.dns_name]
  ttl     = 360
}
//resource "aws_route53_record" "lb_record_stf_internal" {
//  name = "storefront"
//
//  type    = "CNAME"
//  zone_id = aws_route53_zone.demo_internal.id
//  records = [aws_elb.lb_stf.dns_name]
//  ttl     = 360
//}

resource "aws_route53_record" "lb_record_ddc" {
  name = "ddc"

  type    = "CNAME"
  zone_id = aws_route53_zone.demo_e2evc.id
  records = [aws_elb.lb_ddc.dns_name]
  ttl     = 360
}
//resource "aws_route53_record" "lb_record_ddc_internal" {
//  name = "ddc"
//
//  type    = "CNAME"
//  zone_id = aws_route53_zone.demo_internal.id
//  records = [aws_elb.lb_ddc.dns_name]
//  ttl     = 360
//}
//
//resource "aws_route53_record" "domaincontroller_record" {
//  name = "dc-01"
//
//  type    = "A"
//  zone_id = aws_route53_zone.demo_internal.id
//  records = [data.aws_instance.domaincontroller.private_ip]
//  ttl     = 360
//}