terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
      configuration_aliases = [aws.dev]
    }
  }
}
