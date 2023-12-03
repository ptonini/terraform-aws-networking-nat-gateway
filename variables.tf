variable "name" {}

variable "vpc_id" {}

variable "subnet_id" {}

variable "peering_routes" {
  type = map(object({
    cidr_block    = string
    connection_id = string
  }))
  default = {}
}

variable "network_interface_routes" {
  type = map(object({
    cidr_block           = string
    network_interface_id = string
  }))
  default = {}
}