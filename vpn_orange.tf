output "orange-vpn-address" {
  value = "${module.orange-vpn.ip_address}"
}

module "orange-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.10"
  name     = "orange"
  ssh_keys = ["${values(data.external.ssh_keys.result)}"]
  region   = "us-east"
  image_id = "private/6022036"
  users    = ["szeth", "lift", "jasnah", "kaladin"]
  ansible_repo_path = "${path.root}/ansible"
  type     = "g6-standard-1"
}

resource "linode_domain_record" "orange" {
    domain_id = "${linode_domain.wg.id}"
    name = "orange"
    record_type = "A"
    target = "${module.orange-vpn.ip_address}"
}
