variable "domain" {
  type    = string
  default = "linode.a-rwx.org"
}

variable "instances" {
  type = map(object({
    instance_type = string
    disk_size     = number
  }))
  default = {
    charts = {
      instance_type = "g6-nanode-1"
      disk_size     = 20480
    },
    dmz = {
      instance_type = "g6-standard-1"
      disk_size     = 20480
    },
    codepad = {
      instance_type = "g6-standard-2"
      disk_size     = 61440
    },
    goat = {
      instance_type = "g6-nanode-1"
      disk_size     = 25600
    },
  }
}
