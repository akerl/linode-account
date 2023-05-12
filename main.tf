terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "2.0.0"
    }
  }
}

data "linode_profile" "profile" {}
