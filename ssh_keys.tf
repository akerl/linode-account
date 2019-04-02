data "external" "ssh_keys" {
  program = ["./assets/get_ssh_keys.sh"]
}

data "linode_profile" "profile" {}

resource "linode_sshkey" "keys" {
  count = "${length(data.external.ssh_keys.result)}"

  label   = "${element(keys(data.external.ssh_keys.result), count.index)}"
  ssh_key = "${element(values(data.external.ssh_keys.result), count.index)}"
}
