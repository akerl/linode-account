output "teal-algo-address" {
  value = "${module.teal-algo.ip_address}"
}

module "teal-algo" {
  source = "github.com/akerl/terraform-linode-algo"

  name     = "teal"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
  region   = "us-east"
  image_id = "${module.image.image_id}"
  users    = ["left", "right", "up", "down"]
}
