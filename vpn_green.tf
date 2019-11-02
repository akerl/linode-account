output "green-vpn-address" {
  value = "${module.green-vpn.ip_address}"
}

module "green-vpn" {
  source         = "armorfret/wireguard/linode"
  version        = "0.1.0"
  name           = "green"
  ssh_keys       = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGJ8nnGTRnVJR6Sz6lnYdRchw2Z4S9DFOKTHuJBnMYBS"]
  region         = "ap-south"
  stackscript_id = "${module.stackscript.stackscript_id}"
  image_id       = "${var.image_id}"
  users          = ["szeth", "lift", "jasnah", "kaladin"]
  type           = "g6-standard-1"
}

resource "linode_domain_record" "green" {
  domain_id   = "${linode_domain.wg.id}"
  name        = "green"
  record_type = "A"
  target      = "${module.green-vpn.ip_address}"
}
