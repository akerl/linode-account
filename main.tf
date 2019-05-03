provider "linode" {
  version = "1.6.0"
}

provider "template" {
  version = "2.1.1"
}

provider "random" {
  version = "2.1.1"
}

provider "null" {
  version = "2.1.1"
}

provider "external" {
  version = "1.1.1"
}

data "linode_profile" "profile" {}
