output "gray-vpn-address" {
  value = "${module.gray-vpn.ip_address}"
}

module "gray-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.10"
  name     = "gray"
  ssh_keys = ["${values(data.external.ssh_keys.result)}"]
  region   = "eu-west"
  image_id = "private/6022036"
  users    = ["szeth", "lift", "jasnah", "kaladin"]
  ansible_repo_path = "${path.root}/ansible"
  type     = "g6-standard-1"
}

resource "linode_domain_record" "gray" {
    domain_id = "${linode_domain.wg.id}"
    name = "gray"
    record_type = "A"
    target = "${module.gray-vpn.ip_address}"
}
