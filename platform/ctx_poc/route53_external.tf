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


resource "aws_route53_record" "lb_record_stf" {
  name = "storefront"

  type    = "CNAME"
  zone_id = aws_route53_zone.demo_e2evc.id
  records = [aws_lb.storefront.dns_name]
  ttl     = 360
}

resource "aws_route53_record" "vda" {
  count         = local.vdas.count
  name = format("${local.vdas.prefix}-%02s", count.index + 1)

  type    = "A"
  zone_id = aws_route53_zone.demo_e2evc.id
  records = [aws_instance.vda[count.index].public_ip]
  ttl     = 360
}