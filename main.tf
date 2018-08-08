provider "linode" {}

variable "ssh_key" {
  type    = "string"
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPrm9UdL04EOBdgpluugFsai+PMIqF2tNmVH757JHH3I"
}

output "test-address" {
  value = "${module.test.ip_address}"
}

module "test" {
  source  = "github.com/akerl/terraform-linode-algo"
  name    = "test"
  ssh_key = "${var.ssh_key}"

  users = [
    "alfa",
    "beta",
  ]
}
