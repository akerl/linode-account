output "green-algo-address" {
  value = "${module.green-algo.ip_address}"
}

module "green-algo" {
  source = "github.com/akerl/terraform-linode-algo"

  name     = "green"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
  region   = "us-central"
  image_id = "${module.image.image_id}"
  users    = ["alfa", "bravo", "charlie"]
}
