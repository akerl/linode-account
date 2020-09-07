output "pumidor_address" {
  value = linode_instance.pumidor.ip_address
}

resource "linode_instance" "pumidor" {
  label = "pumidor"

  region = "us-east"
  type   = "g6-standard-2"

  disk {
    label            = "root"
    size             = 20480
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
