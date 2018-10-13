provider "linode" {}

variable "ssh_keys" {
  type = "list"

  default = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPrm9UdL04EOBdgpluugFsai+PMIqF2tNmVH757JHH3I",
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPkiSoS5U0Zef2hRKzZ8jk3KIMT5pAiNTMPXf1HzbGZh",
  ]
}

output "blue-algo-address" {
  value = "${module.blue-algo.ip_address}"
}

module "blue-algo" {
  source = "github.com/akerl/terraform-linode-algo"

  name     = "blue"
  ssh_keys = "${var.ssh_keys}"

  users = [
    "alfa",
    "bravo",
  ]
}
