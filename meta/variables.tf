variable "vpns" {
  description = "What VPNs to create"
  type        = "list"
}

variable "regions" {
  description = "Region overrides for specific VPNs"
  type        = "map"
  default     = {}
}

variable "users" {
  description = "User list overrides for specific VPNs"
  type        = "map"
  default     = {}
}

variable "wireguard_version" {
  description = "Version of the wireguard module to use"
  type        = "string"
}
