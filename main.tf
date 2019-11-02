provider "linode" {
  version = "1.8.0"
}

provider "template" {
  version = "2.1.2"
}

provider "random" {
  version = "2.2.1"
}

provider "null" {
  version = "2.1.2"
}

provider "external" {
  version = "1.2.0"
}

data "linode_profile" "profile" {}
