resource "linode_domain" "wg" {
  type      = "master"
  domain    = "wg.scrtybybscrty.org"
  soa_email = "admin@lesaker.org"
}
