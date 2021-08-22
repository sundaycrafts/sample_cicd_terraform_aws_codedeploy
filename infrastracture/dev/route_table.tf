resource "aws_route_table" "dmz" {
  vpc_id = var.vpc_id

  route = [
    {
      cidr_block = "0.0.0.0/0"
      ipv6_cidr_block = "" // optional
      destination_prefix_list_id = "" // optional
      // one of the following arguments must be supplied
      carrier_gateway_id = ""
      egress_only_gateway_id = ""
      gateway_id = aws_internet_gateway.main.id
      instance_id = ""
      local_gateway_id = ""
      nat_gateway_id = ""
      network_interface_id = ""
      transit_gateway_id = ""
      vpc_endpoint_id = ""
      vpc_peering_connection_id = ""
    },
  ]

  tags = {
    Name = "dmz"
  }
}

resource "aws_route_table_association" "dmz" {
  subnet_id      = aws_subnet.dmz.id
  route_table_id = aws_route_table.dmz.id
}
