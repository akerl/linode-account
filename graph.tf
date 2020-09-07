output "graph_address" {
  value = linode_instance.graph.ip_address
}

resource "linode_instance" "graph" {
  label = "graph"

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
