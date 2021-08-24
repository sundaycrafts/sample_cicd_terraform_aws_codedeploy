resource "aws_nat_gateway" "app1" {
  allocation_id = aws_eip.nat_az1.id
  subnet_id = aws_subnet.dmz1.id

  tags = {
    Name = "nat_app1"
  }

  depends_on = [aws_internet_gateway.main]
}

resource "aws_nat_gateway" "app2" {
  allocation_id = aws_eip.nat_az2.id
  subnet_id = aws_subnet.dmz2.id

  tags = {
    Name = "nat_app2"
  }

  depends_on = [aws_internet_gateway.main]
}
