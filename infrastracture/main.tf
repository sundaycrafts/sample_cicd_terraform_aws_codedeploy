terraform {
  backend "remote" {
    organization = "YOUR_ORG"
    workspaces {
      name = "YOUR_WORKSPACE"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

module "common" {
  source = "./common"
  providers = {
    aws.dev = aws
    aws.prod = aws.prod
  }
}

module "dev" {
  source = "./dev"
  vpc_id = module.common.dev_vpc_id
  azs = local.dev.azs
  codedeploy_instance_profile_name = module.common.codedeploy_instance_profile_name
  codedeploy_iam_role_arn = module.common.codedeploy_iam_role_arn
  providers = {
    aws.dev = aws
  }
}

module "prod" {
  source = "./prod"
  vpc_id = module.common.prod_vpc_id
  azs = local.prod.azs
  providers = {
    aws.prod = aws.prod
  }
}
