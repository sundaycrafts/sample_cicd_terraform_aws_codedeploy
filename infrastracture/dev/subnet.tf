resource "aws_subnet" "dmz1" {
  provider = aws.dev

  vpc_id = var.vpc_id
  cidr_block = "10.1.1.0/24"
  availability_zone = var.azs[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "dmz1"
    Private = "false"
  }
}

resource "aws_subnet" "dmz2" {
  provider = aws.dev

  vpc_id = var.vpc_id
  cidr_block = "10.1.2.0/24"
  availability_zone = var.azs[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "dmz2"
    Private = "false"
  }
}

resource "aws_subnet" "app1" {
  provider = aws.dev

  vpc_id = var.vpc_id
  cidr_block = "10.1.101.0/24"
  availability_zone = var.azs[0]

  tags = {
    Name = "app1"
    Private = "true"
  }
}

resource "aws_subnet" "app2" {
  provider = aws.dev

  vpc_id = var.vpc_id
  cidr_block = "10.1.102.0/24"
  availability_zone = var.azs[1]

  tags = {
    Name = "app2"
    Private = "true"
  }
}

resource "aws_subnet" "datastore" {
  provider = aws.dev

  vpc_id = var.vpc_id
  cidr_block = "10.1.201.0/24"
  availability_zone = var.azs[0]

  tags = {
    Name = "datastore"
    Private = "true"
  }
}
