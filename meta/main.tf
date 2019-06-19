data "template_file" "config" {
  template = "${file("${path.module}/assets/vpn.tf.template")}"
  count    = "${length(var.vpns)}"

  vars = {
    name     = "${var.vpns[count.index]}"
    userlist = "${replace(lookup(var.users, var.vpns[count.index]), ",", "\", \"")}"
    region   = "${lookup(var.regions, var.vpns[count.index])}"
    version  = "${var.wireguard_version}"
  }
}

resource "local_file" "output" {
  count    = "${length(var.vpns)}"
  content  = "${data.template_file.config.*.rendered[count.index]}"
  filename = "../vpn_${var.vpns[count.index]}.tf"
}
