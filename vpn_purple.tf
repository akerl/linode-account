output "purple-vpn-address" {
  value = "${module.purple-vpn.ip_address}"
}

module "purple-vpn" {
  source         = "armorfret/wireguard/linode"
  version        = "0.0.13"
  name           = "purple"
  ssh_keys       = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGJ8nnGTRnVJR6Sz6lnYdRchw2Z4S9DFOKTHuJBnMYBS"]
  region         = "ap-south"
  stackscript_id = "${module.stackscript.stackscript_id}"
  image_id       = "${var.image_id}"
  users          = ["szeth", "lift", "jasnah", "kaladin"]
  type           = "g6-standard-1"
}

resource "linode_domain_record" "purple" {
  domain_id   = "${linode_domain.wg.id}"
  name        = "purple"
  record_type = "A"
  target      = "${module.purple-vpn.ip_address}"
}
