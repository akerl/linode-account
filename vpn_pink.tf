output "pink-vpn-address" {
  value = "${module.pink-vpn.ip_address}"
}

module "pink-vpn" {
  source         = "armorfret/wireguard/linode"
  version        = "0.1.0"
  name           = "pink"
  ssh_keys       = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGJ8nnGTRnVJR6Sz6lnYdRchw2Z4S9DFOKTHuJBnMYBS"]
  region         = "eu-west"
  stackscript_id = "${module.stackscript.stackscript_id}"
  image_id       = "${var.image_id}"
  users          = ["szeth", "lift", "jasnah", "kaladin"]
  type           = "g6-standard-1"
}

resource "linode_domain_record" "pink" {
  domain_id   = "${linode_domain.wg.id}"
  name        = "pink"
  record_type = "A"
  target      = "${module.pink-vpn.ip_address}"
}
