provider "linode" {}

variable "ssh_key" {
  type    = "string"
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPrm9UdL04EOBdgpluugFsai+PMIqF2tNmVH757JHH3I"
}

output "green-algo-address" {
  value = "${module.green-algo.ip_address}"
}

module "green-algo" {
  source = "github.com/akerl/terraform-linode-algo"

  name    = "green"
  ssh_key = "${var.ssh_key}"

  users = [
    "alfa",
    "bravo",
  ]
}
