output "green-vpn-address" {
  value = "${module.green-vpn.ip_address}"
}

module "green-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.10"
  name     = "green"
  ssh_keys = ["${values(data.external.ssh_keys.result)}"]
  region   = "ap-south"
  image_id = "private/6022036"
  users    = ["left", "right", "up", "down"]
  ansible_repo_path = "${path.root}/ansible"
  type     = "g6-standard-1"
}

resource "linode_domain_record" "green" {
    domain_id = "${linode_domain.wg.id}"
    name = "green"
    record_type = "A"
    target = "${module.green-vpn.ip_address}"
}
