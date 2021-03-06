resource "aws_subnet" "dmz" {
  provider = aws.prod

  vpc_id = var.vpc_id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.azs[0]

tags = {
    Name = "dmz"
    Private = "false"
  }
}

resource "aws_subnet" "app" {
  provider = aws.prod

  vpc_id = var.vpc_id
  cidr_block = "10.0.101.0/24"
  availability_zone = var.azs[0]

  tags = {
    Name = "app"
    Private = "true"
  }
}

resource "aws_subnet" "datastore" {
  provider = aws.prod

  vpc_id = var.vpc_id
  cidr_block = "10.0.102.0/24"
  availability_zone = var.azs[0]

  tags = {
    Name = "datastore"
    Private = "true"
  }
}
