resource "aws_security_group" "elb_frontend" {
  name = "elb_frontend"
  description = "For ELB frontend"
  vpc_id = var.vpc_id

  ingress = [
    {
      description = "Accept HTTP"
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = [
        "0.0.0.0/0"]
      ipv6_cidr_blocks = [
        "::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }]

  egress = [
    {
      description = "Accept All"
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = [
        "0.0.0.0/0"]
      ipv6_cidr_blocks = [
        "::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }]

  tags = {
    Name = "elb_frontend"
  }
}

resource "aws_default_security_group" "default" {
  vpc_id = var.vpc_id

  ingress = [
    {
      description = "Accept all inbound data from hosts with same rule"
      from_port = 0
      to_port = 0
      protocol = -1
      prefix_list_ids = []
      security_groups = []
      ipv6_cidr_blocks = []
      cidr_blocks = []
      self = true
    }]

  egress = [
    {
      description = "Accept all outbound data"
      from_port = 0
      to_port = 0
      protocol = -1
      cidr_blocks = [
        "0.0.0.0/0"]
      ipv6_cidr_blocks = [
        "::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }]

  tags = {
    Name = "default_sg"
  }
}

resource "aws_security_group" "bastion" {
  name = "bastion"
  description = "bastion security group"
  vpc_id = var.vpc_id

  ingress = [
    {
      description = "Accept SSH"
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = [
        "0.0.0.0/0"]
      ipv6_cidr_blocks = [
        "::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }]

  tags = {
    Name = "bastion_sg"
  }
}
