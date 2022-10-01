terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.29.2"
    }
  }
}

data "linode_profile" "profile" {}
