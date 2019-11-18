output "orange-vpn-address" {
  value = module.orange-vpn.ip_address
}

module "orange-vpn" {
  source         = "armorfret/wireguard/linode"
  version        = "0.2.0"
  name           = "orange"
  ssh_keys       = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGJ8nnGTRnVJR6Sz6lnYdRchw2Z4S9DFOKTHuJBnMYBS"]
  region         = "us-east"
  stackscript_id = module.stackscript.stackscript_id
  image_id       = var.image_id
  users          = ["szeth", "lift", "jasnah", "kaladin"]
  type           = "g6-standard-1"
}

resource "linode_domain_record" "orange" {
  domain_id   = linode_domain.wg.id
  name        = "orange"
  record_type = "A"
  target      = module.orange-vpn.ip_address
}
