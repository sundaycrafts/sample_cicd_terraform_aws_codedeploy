resource "aws_vpc" "prod" {
  provider = aws.prod
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "prod"
  }
}

resource "aws_vpc" "dev" {
  provider = aws.dev
  cidr_block = "10.1.0.0/16"

  tags = {
    Name = "dev"
  }
}
