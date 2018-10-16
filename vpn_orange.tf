output "orange-algo-address" {
  value = "${module.orange-algo.ip_address}"
}

module "orange-algo" {
  source = "github.com/akerl/terraform-linode-algo"

  name     = "orange"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
  region   = "ap-south"
  image_id = "${module.image.image_id}"
  users = ["alfa", "beta"]
}
