resource "aws_lb" "frontend" {
  name = "frontend"
  internal = false
  load_balancer_type = "application"
  security_groups = [aws_security_group.elb_frontend.id]
  ip_address_type = "ipv4"

  subnets = [aws_subnet.app.id]

  tags = {
    Name = "frontend"
  }
}

resource "aws_lb_target_group" "frontend" {
  name = "frontend"
  port = 80
  protocol = "HTTP"
  vpc_id = var.vpc_id
}

resource "aws_lb_target_group_attachment" "frontend" {
  target_group_arn = aws_lb_target_group.frontend.arn
  target_id        = aws_instance.app_server.id
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
