output "pink-vpn-address" {
  value = "${module.pink-vpn.ip_address}"
}

module "pink-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.4"
  name     = "pink"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
  region   = "eu-west"
  image_id = "private/6003431"
  users    = ["left", "right", "up", "down"]
  type     = "g6-standard-1"
}
