terraform {
  required_providers {
    external = {
      source  = "hashicorp/external"
      version = "1.2.0"
    }
    linode = {
      source  = "terraform-providers/linode"
      version = "1.11.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "2.1.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "2.2.1"
    }
    template = {
      source  = "hashicorp/template"
      version = "2.1.2"
    }
  }
  required_version = ">= 0.13"
}
