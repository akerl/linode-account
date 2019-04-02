output "gray-vpn-address" {
  value = "${module.gray-vpn.ip_address}"
}

module "gray-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.8"
  name     = "gray"
  ssh_keys = ["${values(data.external.ssh_keys.result)}"]
  region   = "eu-west"
  image_id = "private/6003431"
  users    = ["left", "right", "up", "down"]
  type     = "g6-standard-1"
}
