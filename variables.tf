variable "vpc_id" {}

variable "subnet_id" {}

variable "peering_routes" {
  default = {}
  type = map(object({
    cidr_block    = string
    connection_id = string
  }))
}