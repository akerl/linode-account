output "pink-vpn-address" {
  value = "${module.pink-vpn.ip_address}"
}

module "pink-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.10"
  name     = "pink"
  ssh_keys = ["${values(data.external.ssh_keys.result)}"]
  region   = "eu-west"
  image_id = "private/6022036"
  users    = ["left", "right", "up", "down"]
  ansible_repo_path = "${path.root}/ansible"
  type     = "g6-standard-1"
}

resource "linode_domain_record" "pink" {
    domain_id = "${linode_domain.wg.id}"
    name = "pink"
    record_type = "A"
    target = "${module.pink-vpn.ip_address}"
}
