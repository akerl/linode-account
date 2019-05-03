output "blue-vpn-address" {
  value = "${module.blue-vpn.ip_address}"
}

module "blue-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.10"
  name     = "blue"
  ssh_keys = ["${values(data.external.ssh_keys.result)}"]
  region   = "ap-south"
  image_id = "private/6022036"
  users    = ["szeth", "lift", "jasnah", "kaladin"]
  ansible_repo_path = "${path.root}/ansible"
  type     = "g6-standard-1"
}

resource "linode_domain_record" "blue" {
    domain_id = "${linode_domain.wg.id}"
    name = "blue"
    record_type = "A"
    target = "${module.blue-vpn.ip_address}"
}
