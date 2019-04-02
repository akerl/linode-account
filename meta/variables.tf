variable "vpns" {
  description = "What VPNs to create"
  type        = "list"
}

variable "default_region" {
  description = "Default region for VPNs"
  type        = "string"
  default     = "us-central"
}

variable "regions" {
  description = "Region overrides for specific VPNs"
  type        = "map"
  default     = {}
}

variable "default_users" {
  description = "Default user list for VPNs"
  type        = "string"
  default     = "alfa,beta"
}

variable "users" {
  description = "User list overrides for specific VPNs"
  type        = "map"
  default     = {}
}

variable "image_id" {
  description = "Image ID to base VPN VMs on"
  type        = "string"
  default     = "private/6005216"
}
