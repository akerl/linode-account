provider "linode" {}

variable "ssh_key" {
  type = "string"
}

resource "linode_instance" "algo" {
  label = "algo"

  image  = "linode/ubuntu18.04"
  kernel = "linode/direct-disk"
  region = "us-central"
  type   = "g6-standard-4"

  ssh_key = "${var.ssh_key}"
}
