


locals {
  dns_suffix     = "infraxo-dev.com"
  subdomain      = "demo"
  subdomain_fqdn = "${local.subdomain}.${local.dns_suffix}"
  certificate    = "*.${local.subdomain_fqdn}"
  administrative_user_to_create = "installer"
  vms = [
    {
      hostname      = "ctx-ddc-01"
      size          = "t3a.xlarge"
      function      = "deliverycontroller"
      configuration = "GRP#08d80b9f-82d4-4e5e-da42-151a518d8ddd"
    },
    {
      hostname      = "ctx-ddc-02"
      size          = "t3a.xlarge"
      function      = "deliverycontroller"
      configuration = "GRP#08d80b9f-b446-fd02-5dcd-fc37ee141e7c"

    },
    {
      hostname      = "ctx-stf-01"
      size          = "t3a.xlarge"
      function      = "storefront"
      configuration = "GRP#08d80be6-d68e-1178-0f0d-df241b0c3eba"
    },
    {
      hostname      = "ctx-stf-02"
      size          = "t3a.xlarge"
      function      = "storefront"
      configuration = "GRP#08d80be6-e440-1f39-5706-4553612044c1"

    }
  ]
}