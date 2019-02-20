output "brown-algo-address" {
  value = "${module.brown-algo.ip_address}"
}

module "brown-algo" {
  source = "github.com/akerl/terraform-linode-algo"

  name     = "brown"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
  region   = "eu-west"
  image_id = "${module.image.image_id}"
  users    = ["left", "right", "up", "down"]
  type     = "g6-standard-1"
}
