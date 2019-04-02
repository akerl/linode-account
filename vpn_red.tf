output "red-vpn-address" {
  value = "${module.red-vpn.ip_address}"
}

module "red-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.4"
  name     = "red"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
  region   = "us-east"
  image_id = "private/6003431"
  users    = ["left", "right", "up", "down"]
  type     = "g6-standard-1"
}
