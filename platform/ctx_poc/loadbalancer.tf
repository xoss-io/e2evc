resource "aws_lb" "storefront" {
  name               = "lb-storefront"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.default.id, aws_security_group.lb_storefront.id]
  subnets            = data.aws_subnet_ids.default.ids

  enable_deletion_protection = false
  enable_http2 = true
}

resource "aws_lb_target_group" "storefront" {
  name     = "tg-storefront"
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.default.id
  stickiness {
    type = "lb_cookie"
    cookie_duration = 300
    enabled = true
  }
  health_check {
    enabled = true
    matcher = local.lb_storefront.allow_status
    path = local.lb_storefront.health_check_url

  }
}

resource "aws_lb_listener" "storefront" {
  load_balancer_arn = aws_lb.storefront.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = aws_acm_certificate.cert.arn

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.storefront.arn
  }
}

resource "aws_lb_listener" "storefront_redirect" {
  load_balancer_arn = aws_lb.storefront.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = "443"
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

resource "aws_lb_target_group_attachment" "storefront" {
  count = length(local.storefronts)
  target_group_arn = aws_lb_target_group.storefront.arn
  target_id        = local.storefronts[count.index]
  port             = 80
}