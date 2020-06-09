resource "aws_security_group" "ingress_http" {
  name   = "ingress_allow_http"
  vpc_id = data.aws_vpc.default.id

  # Allow inbound HTTP requests
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
resource "aws_security_group" "ingress_rdp" {
  name   = "ingress_allow_rdp"
  vpc_id = data.aws_vpc.default.id

  # Allow inbound HTTP requests
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "egress_any" {
  name   = "egress_any"
  vpc_id = data.aws_vpc.default.id

  # Allow inbound HTTP requests
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_security_group" "ingress_internal" {
  name   = "ingress_internal"
  vpc_id = data.aws_vpc.default.id

  # Allow inbound HTTP requests
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["172.31.0.0/16"]
  }
}

resource "aws_security_group" "ingress_winrm" {
   name   = "ingress_allow_winrm"
   vpc_id = data.aws_vpc.default.id

   ingress {
    from_port   = 5985
    to_port     = 5986
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}