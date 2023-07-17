output "charts_address" {
  value = linode_instance.charts.ip_address
}

resource "linode_instance" "charts" {
  label = "charts"

  region = "us-east"
  type   = "g6-nanode-1"

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
