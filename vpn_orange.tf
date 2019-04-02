output "orange-vpn-address" {
  value = "${module.orange-vpn.ip_address}"
}

module "orange-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.8"
  name     = "orange"
  ssh_keys = ["${values(data.external.ssh_keys.result)}"]
  region   = "us-east"
  image_id = "private/6005216"
  users    = ["left", "right", "up", "down"]
  type     = "g6-standard-1"
}
