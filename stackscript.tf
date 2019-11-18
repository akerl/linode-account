module "stackscript" {
  source    = "armorfret/wireguard-stackscript/linode"
  version   = "0.2.0"
  image_ids = ["${var.image_id}"]
}
