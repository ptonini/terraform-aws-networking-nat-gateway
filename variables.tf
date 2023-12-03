variable "vpc_id" {}

variable "vpc" {
  type = object({
    name = string
    id   = string
  })
}

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