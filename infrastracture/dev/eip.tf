resource "aws_eip" "nat_az1" {
  vpc = true

  depends_on = [aws_internet_gateway.main]
}
