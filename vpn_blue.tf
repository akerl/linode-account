output "blue-algo-address" {
  value = "${module.blue-algo.ip_address}"
}

module "blue-algo" {
  source   = "armorfret/algo/linode"
  version  = "0.0.1"
  name     = "blue"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
  region   = "ap-south"
  image_id = "${module.image.image_id}"
  users    = ["left", "right", "up", "down"]
  type     = "g6-standard-1"
}
