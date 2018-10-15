variable "vpns" {
  description = "What VPNs to create"
  type        = "map"

  default = {
    green = "alfa,beta"
    gold  = "charlie,delta"
  }
}
