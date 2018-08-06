variable "name" {
  type = "string"
}

variable "ssh_key" {
  type = "string"
}

variable "region" {
  type    = "string"
  default = "us-central"
}

variable "type" {
  type    = "string"
  default = "g6-standard-2"
}

output "address" {
  value = "${linode_instance.algo.ip_address}"
}

resource "linode_instance" "algo" {
  label = "${var.name}-algo"

  image  = "linode/ubuntu18.04"
  kernel = "linode/grub2"
  region = "${var.region}"
  type   = "${var.type}"

  ssh_key       = "${var.ssh_key}"
  root_password = "random"
}
