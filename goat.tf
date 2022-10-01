output "goat_address" {
  value = linode_instance.goat.ip_address
}

resource "linode_instance" "goat" {
  label = "goat"

  region = "us-east"
  type   = "g6-standard-1"

  disk {
    label            = "root"
    size             = 40960
    authorized_users = [data.linode_profile.profile.username]
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
}
