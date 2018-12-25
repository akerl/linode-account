output "cyan-algo-address" {
  value = "${module.cyan-algo.ip_address}"
}

module "cyan-algo" {
  source = "github.com/akerl/terraform-linode-algo"

  name     = "cyan"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
  region   = "us-east"
  image_id = "${module.image.image_id}"
  users    = ["left", "right", "up", "down"]
}
