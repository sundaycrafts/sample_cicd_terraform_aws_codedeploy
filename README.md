# Overview

This is a example of CI/CD environment implemented with:

- [Github Actions](https://github.com/features/actions)
- [Terraform Cloud](https://www.terraform.io/)
- [AWS CodeDeploy](https://aws.amazon.com/codedeploy/)

And this also explains
[Three-Tier Architecture](https://medium.com/the-andela-way/designing-a-three-tier-architecture-in-aws-e5c24671f124)
([official doc](https://docs.aws.amazon.com/whitepapers/latest/serverless-multi-tier-architectures-api-gateway-lambda/three-tier-architecture-overview.html)).

# Prerequisites

- Configure the `backend` of `infrastructure/main.tf` to your environment.
- Setup Terraform Cloud.
- Configure the `on.push.branches` of Github workflow to your main branch.
- set environment for Github workflow for CodeDeploy.
- Create [custom ami](https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/using-features.customenv.html) to run Node.js app and [PM2](https://pm2.keymetrics.io/).

# Expected Behaviour

## Terraform

When you push main branch:
- detect infrastructure changes.
- Terraform Cloud make change remotely.

## CodeDeploy

When you push main branch:
- Create S3 object of app and deploy from Github workflow.
- Run scripts/* following appspec.yml's directive to deploy.
