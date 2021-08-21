resource "aws_subnet" "dmz" {
  provider = aws.dev

  vpc_id = var.vpc_id
  cidr_block = "10.1.1.0/24"
  availability_zone = var.azs

  tags = {
    Name = "dmz"
    Private = "false"
  }
}

resource "aws_subnet" "app" {
  provider = aws.dev

  vpc_id = var.vpc_id
  cidr_block = "10.1.101.0/24"
  availability_zone = var.azs

  tags = {
    Name = "app"
    Private = "true"
  }
}

resource "aws_subnet" "datastore" {
  provider = aws.dev

  vpc_id = var.vpc_id
  cidr_block = "10.1.102.0/24"
  availability_zone = var.azs

  tags = {
    Name = "datastore"
    Private = "true"
  }
}
