output "vpns" {
  value = module.vpns
}

module "vpns" {
  for_each = var.vpns

  source         = "armorfret/wireguard/linode"
  version        = "0.4.1"
  name           = each.key
  region         = lookup(var.regions, each.key, var.default_region)
  stackscript_id = module.stackscript.stackscript_id
  image_id       = var.image_id
  users          = lookup(var.users, each.key, var.default_users)
  type           = "g6-standard-1"
}

resource "linode_domain_record" "vpns" {
  for_each = var.vpns

  domain_id   = linode_domain.wg.id
  name        = each.key
  record_type = "A"
  target      = module.vpns[each.key].ip_address
}

resource "linode_domain" "wg" {
  type      = "master"
  domain    = "wg.scrtybybscrty.org"
  soa_email = "admin@lesaker.org"
}

module "stackscript" {
  source    = "armorfret/wireguard-stackscript/linode"
  version   = "0.4.0"
  image_ids = [var.image_id]
}
