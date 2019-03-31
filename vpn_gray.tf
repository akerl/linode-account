output "gray-vpn-address" {
  value = "${module.gray-vpn.ip_address}"
}

module "gray-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.4"
  name     = "gray"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
  region   = "eu-west"
  image_id = "private/5990925"
  users    = ["left", "right", "up", "down"]
  type     = "g6-standard-1"
}
