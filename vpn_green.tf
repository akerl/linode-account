module "green-algo" {
  source = "github.com/akerl/terraform-linode-algo"

  name     = "green"
  ssh_keys = ["${data.external.ssh_key.result.public_key}"]
  region   = "ap-south"
  image_id = "${module.image.image_id}"

  users = ["alfa", "beta"]
}