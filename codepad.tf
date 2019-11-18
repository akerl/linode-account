output "codepad_address" {
  value = "${linode_instance.codepad.ip_address}"
}

resource "linode_instance" "codepad" {
  label = "codepad"

  region = "us-east"
  type   = "g6-standard-4"

  disk {
    label            = "root"
    size             = 61440
    authorized_users = ["${data.linode_profile.profile.username}"]
    image            = "linode/arch"
  }

  config {
    label  = "default"
    kernel = "linode/grub2"

    devices {
      sda {
        disk_label = "root"
      }
    }
  }

  provisioner "remote-exec" {
    script = "${path.module}/assets/codepad/root.sh"
  }
}
