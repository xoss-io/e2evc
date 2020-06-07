

##################################################################
# Data sources to get VPC, subnet, security group and AMI details
##################################################################
data "aws_vpc" "default" {
default = true
}

data "aws_subnet_ids" "all" {
vpc_id = data.aws_vpc.default.id
}

data "aws_ami" "amazon_linux" {
most_recent = true

owners = ["amazon"]

filter {
name = "name"

values = [
"amzn-ami-hvm-*-x86_64-gp2",
]
}

filter {
name = "owner-alias"

values = [
"amazon",
]
}
}

module "security_group" {
source  = "terraform-aws-modules/security-group/aws"
version = "~> 3.0"

name        = "example"
description = "Security group for example usage with EC2 instance"
vpc_id      = data.aws_vpc.default.id

ingress_cidr_blocks = ["0.0.0.0/0"]
ingress_rules       = ["http-80-tcp", "all-icmp"]
egress_rules        = ["all-all"]
}

resource "aws_eip" "this" {
vpc      = true
instance = module.ec2.id[0]
}

resource "aws_placement_group" "web" {
name     = "hunky-dory-pg"
strategy = "cluster"
}

resource "aws_kms_key" "this" {
}

resource "aws_network_interface" "this" {
count = 1

subnet_id = tolist(data.aws_subnet_ids.all.ids)[count.index]
}

module "ec2" {
source = "../../"

instance_count = 1

name          = "example-normal"
ami           = data.aws_ami.amazon_linux.id
instance_type = "c5.large"
subnet_id     = tolist(data.aws_subnet_ids.all.ids)[0]
//  private_ips                 = ["172.31.32.5", "172.31.46.20"]
vpc_security_group_ids      = [module.security_group.this_security_group_id]
associate_public_ip_address = true
placement_group             = aws_placement_group.web.id

user_data_base64 = base64encode(local.user_data)

root_block_device = [
{
volume_type = "gp2"
volume_size = 10
},
]

ebs_block_device = [
{
device_name = "/dev/sdf"
volume_type = "gp2"
volume_size = 5
encrypted   = true
kms_key_id  = aws_kms_key.this.arn
}
]

tags = {
"Env"      = "Private"
"Location" = "Secret"
}
}


