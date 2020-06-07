resource "aws_route53_zone" "infraxo_domain" {
  name = "${var.domain_name}"

  // For private hosted zone
  vpc {
    vpc_id = "${module.vpc.vpc_id}"
  }

  vpc {
    vpc_id = "${data.aws_vpc.acceptor.id}"
  }
}
