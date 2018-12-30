output "codepad_address" {
  value = "${linode_instance.codepad.ip_address}"
}

resource "linode_instance" "codepad" {
  label = "codepad"

  region = "us-east"
  type   = "g6-standard-4"

  disk {
    label           = "root"
    size            = 102400
    authorized_keys = ["${data.external.ssh_key.result.public_key}"]
    image           = "linode/arch"
  }

  config {
    label  = "default"
    kernel = "linode/grub2"

    devices {
      sda = {
        disk_label = "root"
      }
    }
  }

  provisioner "remote-exec" {
    script = "${path.module}/assets/codepad/root.sh"
  }
}
