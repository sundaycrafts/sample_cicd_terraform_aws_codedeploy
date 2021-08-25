output "dev_vpc_id" {
  value = aws_vpc.dev.id
}

output "dev_cidr_block" {
  value = aws_vpc.dev.cidr_block
}

output "prod_vpc_id" {
  value = aws_vpc.prod.id
}

output "prod_cidr_block" {
  value = aws_vpc.prod.cidr_block
}

output "codedeploy_instance_profile_name" {
  value = aws_iam_instance_profile.codedeploy_ec2_instance_profile.name
}

output "codedeploy_iam_role_arn" {
  value = aws_iam_role.codedeploy_service_role.arn
}
