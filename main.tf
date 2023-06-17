terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.4.0"
    }
  }
}

data "linode_profile" "profile" {}
