output "green-vpn-address" {
  value = "${module.green-vpn.ip_address}"
}

module "green-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.6"
  name     = "green"
  ssh_users = ["${data.linode_profile.profile.username}"]
  region   = "ap-south"
  image_id = "private/6003431"
  users    = ["left", "right", "up", "down"]
  type     = "g6-standard-1"
}
