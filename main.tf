terraform {
  required_providers {
    linode = {
      source  = "linode/linode"
      version = "1.30.0"
    }
  }
}

data "linode_profile" "profile" {}
