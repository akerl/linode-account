module "stackscript" {
  source    = "armorfret/wireguard-stackscript/linode"
  version   = "0.0.6"
  image_ids = ["${var.image_id}"]
}
