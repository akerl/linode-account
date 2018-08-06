provider "linode" {}

variable "ssh_key" {
  type = "string"
}

output "green-algo-address" {
  value = "${module.green-algo.address}"
}

output "red-algo-address" {
  value = "${module.red-algo.address}"
}

module "green-algo" {
  source  = "./modules/algo"
  name    = "green"
  ssh_key = "${var.ssh_key}"
}

module "red-algo" {
  source  = "./modules/algo"
  name    = "green"
  ssh_key = "${var.ssh_key}"
}
