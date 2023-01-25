variable "vnet_ressource_group_name" {
  type        = string
  description = "resource group for the VNET"

}
variable "vnet_name" {
  type        = string
  description = "Name of the VNET"
}

variable "vnet_location" {
  type        = string
  description = "Location of the VNET"
}

variable "vnet_address_space" {
  type        = list(any)
  description = "IP scope of the VNET (e.g. [ '192.168.0.0/23' ])"
}

variable "vnet_subnet_details" {
  type        = map(any)
  default     = null
  description = "Map of the subnetdetails (e.g. {'subnet1' = ['192.168.0.0/24']})"
}