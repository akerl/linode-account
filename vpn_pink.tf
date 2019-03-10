output "pink-algo-address" {
  value = "${module.pink-algo.ip_address}"
}

module "pink-algo" {
  source   = "armorfret/algo/linode"
  version  = "0.0.1"
  name     = "pink"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
  region   = "eu-west"
  image_id = "${module.image.image_id}"
  users    = ["left", "right", "up", "down"]
  type     = "g6-standard-1"
}
