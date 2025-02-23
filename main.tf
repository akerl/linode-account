terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.34.1"
    }
  }
}

data "linode_profile" "profile" {}

output "instance_addresses" {
  value = { for i, x in linode_instance.instances : x.label => x.ip_address }
}

resource "linode_instance" "instances" {
  for_each = var.instances

  label  = each.key
  region = each.value.region
  type   = each.value.instance_type
}

resource "linode_instance_disk" "instances" {
  for_each = var.instances

  label            = "root"
  linode_id        = linode_instance.instances[each.key].id
  size             = each.value.disk_size
  image            = "linode/arch"
  authorized_users = [data.linode_profile.profile.username]
}

resource "linode_instance_config" "instances" {
  for_each = var.instances

  label       = "default"
  linode_id   = linode_instance.instances[each.key].id
  root_device = "/dev/sda"
  kernel      = "linode/grub2"
  booted      = true

  device {
    device_name = "sda"
    disk_id     = linode_instance_disk.instances[each.key].id
  }

  helpers {
    updatedb_disabled  = false
    devtmpfs_automount = false
    distro             = false
    modules_dep        = false
    network            = false
  }
}

resource "linode_rdns" "foo" {
  for_each = var.instances

  address = linode_instance.instances[each.key].ip_address
  rdns    = "${each.key}.${var.domain}"
}

