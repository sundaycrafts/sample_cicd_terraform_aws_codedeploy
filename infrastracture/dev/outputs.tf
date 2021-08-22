output "app_subnet_cider_block" {
  value = aws_subnet.app1.cidr_block
}

output "dmz_subnet_cider_block" {
  value = aws_subnet.dmz.cidr_block
}

output "datastore_subnet_cider_block" {
  value = aws_subnet.datastore.cidr_block
}

output "bastion_ip" {
  value = aws_instance.bastion.public_ip
}
