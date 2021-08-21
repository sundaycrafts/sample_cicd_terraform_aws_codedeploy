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
