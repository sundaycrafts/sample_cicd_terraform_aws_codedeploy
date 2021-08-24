resource "aws_route_table" "dmz1" {
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
    Name = "dmz1"
  }
}

resource "aws_route_table_association" "dmz1" {
  subnet_id      = aws_subnet.dmz1.id
  route_table_id = aws_route_table.dmz1.id
}

resource "aws_route_table" "dmz2" {
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
    Name = "dmz2"
  }
}

resource "aws_route_table_association" "dmz2" {
  subnet_id      = aws_subnet.dmz2.id
  route_table_id = aws_route_table.dmz2.id
}

resource "aws_route_table" "nat_app1" {
  vpc_id = var.vpc_id

  route = [
    {
      cidr_block = "0.0.0.0/0"
      ipv6_cidr_block = "" // optional
      destination_prefix_list_id = "" // optional
      // one of the following arguments must be supplied
      carrier_gateway_id = ""
      egress_only_gateway_id = ""
      gateway_id = ""
      instance_id = ""
      local_gateway_id = ""
      nat_gateway_id = aws_nat_gateway.app1.id
      network_interface_id = ""
      transit_gateway_id = ""
      vpc_endpoint_id = ""
      vpc_peering_connection_id = ""
    },
  ]

  tags = {
    Name = "nat_app1"
  }
}

resource "aws_route_table_association" "nat_app1" {
  subnet_id      = aws_subnet.app1.id
  route_table_id = aws_route_table.nat_app1.id
}

resource "aws_route_table" "nat_app2" {
  vpc_id = var.vpc_id

  route = [
    {
      cidr_block = "0.0.0.0/0"
      ipv6_cidr_block = "" // optional
      destination_prefix_list_id = "" // optional
      // one of the following arguments must be supplied
      carrier_gateway_id = ""
      egress_only_gateway_id = ""
      gateway_id = ""
      instance_id = ""
      local_gateway_id = ""
      nat_gateway_id = aws_nat_gateway.app2.id
      network_interface_id = ""
      transit_gateway_id = ""
      vpc_endpoint_id = ""
      vpc_peering_connection_id = ""
    },
  ]

  tags = {
    Name = "nat_app2"
  }
}

resource "aws_route_table_association" "nat_app2" {
  subnet_id      = aws_subnet.app2.id
  route_table_id = aws_route_table.nat_app2.id
}
