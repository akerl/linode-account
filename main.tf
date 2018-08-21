provider "linode" {}

variable "ssh_key" {
  type    = "string"
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPrm9UdL04EOBdgpluugFsai+PMIqF2tNmVH757JHH3I"
}

output "blue-algo-address" {
  value = "${module.blue-algo.ip_address}"
}

module "blue-algo" {
  source = "github.com/akerl/terraform-linode-algo"

  name    = "blue"
  ssh_key = "${var.ssh_key}"

  users = [
    "alfa",
    "bravo",
  ]
}
