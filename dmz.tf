output "dmz_address" {
  value = linode_instance.dmz.ip_address
}

resource "linode_instance" "dmz" {
  label = "dmz"

  region = "us-east"
  type   = "g6-standard-1"

  disk {
    label            = "root"
    size             = 20480
    authorized_users = [data.linode_profile.profile.username]
    image            = "linode/archlinux"
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
