variable "image_id" {
  type        = string
  description = "Image ID to deploy"
  default     = "linode/ubuntu18.04"
}

variable "vpns" {
  description = "What VPNs to create"
  type        = set(string)
}

variable "regions" {
  description = "Region overrides for specific VPNs"
  type        = map(string)
  default     = {}
}

variable "default_region" {
  description = "Default region for VPNs"
  type        = string
}

variable "users" {
  description = "User list overrides for specific VPNs"
  type        = map(set(string))
  default     = {}
}

variable "default_users" {
  description = "Default user list for VPNs"
  type        = set(string)
}
