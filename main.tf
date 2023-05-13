terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.1.1"
    }
  }
}

data "linode_profile" "profile" {}
