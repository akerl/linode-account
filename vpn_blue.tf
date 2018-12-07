output "blue-algo-address" {
  value = "${module.blue-algo.ip_address}"
}

module "blue-algo" {
  source = "github.com/akerl/terraform-linode-algo"

  name     = "blue"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
  region   = "us-east"
  image_id = "${module.image.image_id}"
  users    = ["alfa", "beta"]
}
