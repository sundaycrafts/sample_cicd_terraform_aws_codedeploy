resource "aws_instance" "app_server" {
  provider = aws.dev

  subnet_id = aws_subnet.app1.id

  ami = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  key_name = aws_key_pair.app1.key_name

  tags = {
    Name = "app-server"
  }
}

resource "aws_instance" "bastion" {
  provider = aws.dev

  subnet_id = aws_subnet.dmz.id

  ami = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  key_name = aws_key_pair.bastion.key_name

  tags = {
    Name = "bastion"
  }
}
