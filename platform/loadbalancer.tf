resource "aws_elb" "lb_stf" {
  name = "lb-storefront"

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"

  }
  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = aws_acm_certificate.cert.id
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = [for vm in aws_instance.ec2 : vm.id if vm.tags.function == "storefront"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  subnets = data.aws_subnet_ids.default.ids

  security_groups = [aws_security_group.ingress_http.id]
  tags = {
    Name = "lb-storefront"
  }
}

resource "aws_elb" "lb_ddc" {
  name = "lb-ddc"

  listener {
    instance_port     = 80
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"

  }
  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    ssl_certificate_id = aws_acm_certificate.cert.id
  }
  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:80/"
    interval            = 30
  }

  instances                   = [for vm in aws_instance.ec2 : vm.id if vm.tags.function == "deliverycontroller"]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400

  subnets = data.aws_subnet_ids.default.ids

  security_groups = [aws_security_group.ingress_http.id]
  tags = {
    Name = "lb-ddc"
  }
}