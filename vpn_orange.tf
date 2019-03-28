output "orange-algo-address" {
  value = "${module.orange-algo.ip_address}"
}

module "orange-algo" {
  source   = "armorfret/algo/linode"
  version  = "0.0.1"
  name     = "orange"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
  region   = "us-east"
  image_id = "${module.image.image_id}"
  users    = ["left", "right", "up", "down"]
  type     = "g6-standard-1"
}
