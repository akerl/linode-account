provider "linode" {
  version = "1.5.0"
}

provider "template" {
  version = "2.1.0"
}

provider "random" {
  version = "2.1.0"
}

provider "null" {
  version = "2.1.0"
}

provider "external" {
  version = "1.1.0"
}

data "external" "ssh_key" {
  program = ["./assets/get_ssh_key.sh"]
}
