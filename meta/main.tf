data "template_file" "config" {
  template = "${file("${path.module}/assets/vpn.tf.template")}"
  count    = "${length(var.vpns)}"

  vars {
    name     = "${element(keys(var.vpns), count.index)}"
    userlist = "\"${replace(element(values(var.vpns), count.index), ",", "\", \"")}\""
    region   = "${lookup(var.regions, element(keys(var.vpns), count.index), var.default_region)}"
  }
}

resource "local_file" "output" {
  count    = "${length(var.vpns)}"
  content  = "${element(data.template_file.config.*.rendered, count.index)}"
  filename = "../vpn_${element(keys(var.vpns), count.index)}.tf"
}
