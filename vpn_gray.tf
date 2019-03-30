output "gray-vpn-address" {
  value = "${module.gray-vpn.ip_address}"
}

module "gray-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.3"
  name     = "gray"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
  region   = "eu-west"
  image_id = "${module.image.image_id}"
  users    = ["left", "right", "up", "down"]
  type     = "g6-standard-1"
}
