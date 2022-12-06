output "this" {
  value = aws_nat_gateway.this
}

output "ip_address" {
  value = aws_eip.this.public_ip
}

output "route_table_id" {
  value = aws_route_table.this.id
}