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
      cidr_blocks = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }]

  egress = [
    {
      description = "Accept All"
      from_port = 0
      to_port = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids = []
      security_groups = []
      self = false
    }]

  tags = {
    Name = "elb_frontend"
  }
}
