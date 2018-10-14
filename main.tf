provider "linode" {}

variable "ssh_keys" {
  type = "list"

  default = [
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPrm9UdL04EOBdgpluugFsai+PMIqF2tNmVH757JHH3I",
    "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPkiSoS5U0Zef2hRKzZ8jk3KIMT5pAiNTMPXf1HzbGZh",
  ]
}

output "green-algo-address" {
  value = "${module.green-algo.ip_address}"
}

module "green-algo" {
  source = "github.com/akerl/terraform-linode-algo"

  name     = "green"
  ssh_keys = "${var.ssh_keys}"
  region   = "ap-south"

  users = [
    "alfa",
    "bravo",
  ]
}
