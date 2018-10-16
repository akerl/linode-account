provider "linode" {
  version = "0.2.8"
}

data "external" "ssh_key" {
  program = ["./assets/get_ssh_key.sh"]
}

module "image" {
  source   = "github.com/akerl/terraform-linode-algo-image"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
}
