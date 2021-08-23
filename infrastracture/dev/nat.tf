resource "aws_nat_gateway" "app1" {
  allocation_id = aws_eip.nat_az1.id
  subnet_id = aws_subnet.dmz.id

  tags = {
    Name = "nat_app1"
  }

  depends_on = [aws_internet_gateway.main]
}
