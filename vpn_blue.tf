output "blue-vpn-address" {
  value = "${module.blue-vpn.ip_address}"
}

module "blue-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.8"
  name     = "blue"
  ssh_keys = ["${values(data.external.ssh_keys.result)}"]
  region   = "ap-south"
  image_id = "private/6005216"
  users    = ["left", "right", "up", "down"]
  type     = "g6-standard-1"
}
