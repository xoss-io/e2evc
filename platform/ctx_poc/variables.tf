


locals {
  management_ips = ["0.0.0.0/0"]
  dns_suffix     = "infraxo-dev.com"
  subdomain      = "demo"
  subdomain_fqdn = "${local.subdomain}.${local.dns_suffix}"

  certificate    = "*.${local.subdomain_fqdn}"
  lb_storefront = {
    allow_status = "200,301,302"
    health_check_url = "/Citrix/DemoWeb"
  }
  administrative_user_to_create = "installer"
  vms = [
    {
      hostname      = "ctx-ddc-01"
      size          = "t2.large"
      function      = "deliverycontroller"
      configuration = "GRP#08d80b9f-82d4-4e5e-da42-151a518d8ddd"
    },
    {
      hostname      = "ctx-ddc-02"
      size          = "t2.large"
      function      = "deliverycontroller"
      configuration = "GRP#08d80b9f-b446-fd02-5dcd-fc37ee141e7c"

    },
    {
      hostname      = "ctx-stf-01"
      size          = "t2.medium"
      function      = "storefront"
      configuration = "GRP#08d80be6-d68e-1178-0f0d-df241b0c3eba"
    },
    {
      hostname      = "ctx-stf-02"
      size          = "t2.medium"
      function      = "storefront"
      configuration = "GRP#08d80be6-e440-1f39-5706-4553612044c1"

    }
  ]
  vdas = {
    count = 1
    prefix = "VDA"
    configuration = "GRP#08d80c93-ab3d-c2ba-d6c6-921408b0ae95"
    size          = "t3a.medium"
  }
  storefronts = [for vm in aws_instance.ec2 : vm.id if vm.tags.function == "storefront"]
  deliverycontroller = [for vm in aws_instance.ec2 : vm.id if vm.tags.function == "deliverycontroller"]
}