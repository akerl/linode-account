output "pink-vpn-address" {
  value = "${module.pink-vpn.ip_address}"
}

module "pink-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.6"
  name     = "pink"
  ssh_users = ["${data.linode_profile.profile.username}"]
  region   = "eu-west"
  image_id = "private/6003431"
  users    = ["left", "right", "up", "down"]
  type     = "g6-standard-1"
}
