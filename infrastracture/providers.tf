provider "aws" {
  region = local.prod.region
  alias = "prod"

  default_tags {
    tags = {
      Terraform = "true"
      Environment = "prod"
    }
  }
}

provider "aws" {
  region = local.dev.region

  default_tags {
    tags = {
      Terraform = "true"
      Environment = "dev"
    }
  }
}
