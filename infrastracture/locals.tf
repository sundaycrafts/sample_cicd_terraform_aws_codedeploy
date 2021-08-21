locals {
  prod = {
    region = "eu-west-2"
    azs = ["eu-west-2a", "eu-west-2b", "eu-west-2c"]
  }
  dev = {
    region = "us-east-1"
    azs = "us-east-1a"
  }
}
