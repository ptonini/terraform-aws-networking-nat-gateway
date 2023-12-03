resource "aws_eip" "this" {}

resource "aws_nat_gateway" "this" {
  allocation_id = aws_eip.this.id
  subnet_id     = var.subnet_id
}

resource "aws_route_table" "this" {
  vpc_id = var.vpc_id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  dynamic "route" {
    for_each = var.peering_routes
    content {
      cidr_block                = route.value.cidr_block
      vpc_peering_connection_id = route.value.connection_id
    }
  }

  dynamic "route" {
    for_each = var.network_interface_routes
    content {
      cidr_block           = route.value.cidr_block
      network_interface_id = route.value.network_interface_id
    }
  }

  tags = {
    Name = var.name
  }
}
