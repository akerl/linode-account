output "red-vpn-address" {
  value = "${module.red-vpn.ip_address}"
}

module "red-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.6"
  name     = "red"
  ssh_users = ["${data.linode_profile.profile.username}"]
  region   = "us-east"
  image_id = "private/6003431"
  users    = ["left", "right", "up", "down"]
  type     = "g6-standard-1"
}
