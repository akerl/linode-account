variable "vpns" {
  description = "What VPNs to create"
  type        = "map"
}

variable "default_region" {
  description = "Default region for VPNs"
  type        = "string"
  default     = "us-central"
}

variable "regions" {
  description = "Where to create a VPN"
  type        = "map"
  default     = {}
}
