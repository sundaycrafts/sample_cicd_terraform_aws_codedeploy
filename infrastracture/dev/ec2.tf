resource "aws_instance" "app_server" {
  provider = aws.dev

  subnet_id = aws_subnet.app.id
  availability_zone = var.azs

  ami = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  key_name = aws_key_pair.app.key_name

  tags = {
    Name = "app-server"
  }
}
