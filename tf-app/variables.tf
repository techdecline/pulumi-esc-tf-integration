variable "private_dns_zone_id" {
  description = "The ID of the private DNS zone where resources will be deployed. This is typically a string identifier that uniquely identifies the Azure Private DNS Zone."
  type        = string
  default     = null
}