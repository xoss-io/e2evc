

resource "aws_instance" "my-instance" {
  count         = "${var.instance_count}"
  ami           = "${lookup(var.ami,var.aws_region)}"
  instance_type = "${var.instance_type}"
  key_name      = "${aws_key_pair.terraform-demo.key_name}"
  user_data     = "${file("install_apache.sh")}"

  tags = {
    Name  = "Terraform-${count.index + 1}"
  }
}