resource "linode_domain" "minecraft" {
  type      = "master"
  domain    = "mc.scrtybybscrty.org"
  soa_email = "admin@lesaker.org"
}

resource "linode_domain_record" "minecraft" {
  domain_id   = linode_domain.minecraft.id
  name        = ""
  record_type = "A"
  target      = linode_instance.minecraft.ip_address
}

resource "linode_instance" "minecraft" {
  label = "minecraft"

  region = "us-east"
  type   = "g6-standard-4"

  disk {
    label            = "root"
    size             = 81920
    authorized_users = [data.linode_profile.profile.username]
    image            = "linode/arch"
  }

  disk {
    label      = "swap"
    size       = 16384
    filesystem = "swap"
  }

  config {
    label  = "default"
    kernel = "linode/grub2"

    devices {
      sda {
        disk_label = "root"
      }
      sdb {
        disk_label = "swap"
      }
    }
  }

  provisioner "remote-exec" {
    connection {
      host = linode_instance.minecraft.ip_address
    }
    script = "${path.module}/assets/minecraft/root.sh"
  }
}
