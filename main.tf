provider "linode" {}

variable "ssh_keys" {
  type = "list"

  default = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPrm9UdL04EOBdgpluugFsai+PMIqF2tNmVH757JHH3I",
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPkiSoS5U0Zef2hRKzZ8jk3KIMT5pAiNTMPXf1HzbGZh",
  ]
}

output "gold-algo-address" {
  value = "${module.gold-algo.ip_address}"
}

module "gold-algo" {
  source = "github.com/akerl/terraform-linode-algo"

  name     = "gold"
  ssh_keys = "${var.ssh_keys}"
  region   = "ap-south"

  users = [
    "alfa",
    "bravo",
  ]
}
