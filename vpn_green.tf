output "green-vpn-address" {
  value = "${module.green-vpn.ip_address}"
}

module "green-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.4"
  name     = "green"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
  region   = "ap-south"
  image_id = "private/6003431"
  users    = ["left", "right", "up", "down"]
  type     = "g6-standard-1"
}
