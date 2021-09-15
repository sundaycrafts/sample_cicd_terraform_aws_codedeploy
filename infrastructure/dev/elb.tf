resource "aws_lb" "frontend" {
  name = "frontend"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.elb_frontend.id, aws_default_security_group.default.id]
  ip_address_type = "ipv4"

  subnets = [aws_subnet.dmz1.id, aws_subnet.dmz2.id]

  tags = {
    Name = "frontend"
  }
}

resource "aws_lb_target_group" "frontend" {
  name = "frontend"
  port = 3000
  protocol = "HTTP"
  vpc_id = var.vpc_id
}

resource "aws_lb_target_group_attachment" "frontend1" {
  target_group_arn = aws_lb_target_group.frontend.arn
  target_id        = aws_instance.app1.id
}

resource "aws_lb_target_group_attachment" "frontend2" {
  target_group_arn = aws_lb_target_group.frontend.arn
  target_id        = aws_instance.app2.id
}


resource "aws_lb_listener" "frontend" {
  load_balancer_arn = aws_lb.frontend.arn
  port = "80"
  protocol = "HTTP"

  default_action {
    type = "forward"
    target_group_arn = aws_lb_target_group.frontend.arn
  }
}
