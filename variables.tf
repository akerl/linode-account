variable "domain" {
  type    = string
  default = "linode.a-rwx.org"
}

variable "instances" {
  type = map(object({
    instance_type = string
    disk_size     = number
    region        = string
  }))
  default = {
    charts = {
      instance_type = "g6-nanode-1"
      disk_size     = 20480
      region        = "us-iad"
    },
    dmz = {
      instance_type = "g6-standard-1"
      disk_size     = 20480
      region        = "us-iad"
    },
    codepad = {
      instance_type = "g6-standard-2"
      disk_size     = 61440
      region        = "us-iad"
    },
    goat = {
      instance_type = "g6-nanode-1"
      disk_size     = 25600
      region        = "us-iad"
    },
    proxy = {
      instance_type = "g6-nanode-1"
      disk_size     = 20480
      region        = "us-east"
    },
    k8s = {
      instance_type = "g6-standard-4"
      disk_size     = 61440
      region        = "us-east"
    },
  }
}
