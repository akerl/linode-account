output "red-vpn-address" {
  value = "${module.red-vpn.ip_address}"
}

module "red-vpn" {
  source   = "armorfret/wireguard/linode"
  version  = "0.0.10"
  name     = "red"
  ssh_keys = ["${values(data.external.ssh_keys.result)}"]
  region   = "us-east"
  image_id = "linode/ubuntu18.04"
  users    = ["left", "right", "up", "down"]
  ansible_repo_path = "${path.root}/ansible"
  type     = "g6-standard-1"
}

resource "linode_domain_record" "red" {
    domain_id = "${linode_domain.wg.id}"
    name = "red"
    record_type = "A"
    target = "${module.red-vpn.ip_address}"
}
