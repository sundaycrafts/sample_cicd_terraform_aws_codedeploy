resource "aws_vpc" "prod" {
  provider = aws.prod
  cidr_block = "10.0.0.0/16"

//  azs = [
//    "eu-west-2a",
//    "eu-west-2b",
//    "eu-west-2c"]
//
//  public_subnets = [
//    "10.0.1.0/24"]
//
//  private_subnets = [
//    "10.0.101.0/24",
//    "10.0.102.0/24"]
}

resource "aws_vpc" "dev" {
  provider = aws.dev
  cidr_block = "10.1.0.0/16"

//  azs = [
//    "us-east-1a",
//    "us-east-1b",
//    "us-east-1c"]
//
//  public_subnets = [
//    "10.1.1.0/24"]
//
//  private_subnets = [
//    "10.1.101.0/24",
//    "10.1.102.0/24"]
}
