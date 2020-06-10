resource "aws_security_group" "default" {
  name   = "ctx_poc_default_policy"
  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = 5985
    to_port     = 5986
    protocol    = "tcp"
    cidr_blocks = local.management_ips
  }
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "udp"
    cidr_blocks = local.management_ips
  }
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = local.management_ips
  }
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.31.0.0/16"]
  }
   egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "lb_storefront" {
  name   = "ctx_poc_lb_storefront"
  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "vda" {
  name   = "ctx_poc_vda"
  vpc_id = data.aws_vpc.default.id

  ingress {
    from_port   = 1494
    to_port     = 1494
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 1494
    to_port     = 1494
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
 ingress {
    from_port   = 2598
    to_port     = 2598
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 2598
    to_port     = 2598
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}