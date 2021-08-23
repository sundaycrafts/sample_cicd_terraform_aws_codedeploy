resource "aws_instance" "app_server" {
  provider = aws.dev

  subnet_id = aws_subnet.app1.id

  ami = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"
  key_name = aws_key_pair.app1.key_name

  vpc_security_group_ids = [
    aws_default_security_group.default.id]

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

  vpc_security_group_ids = [
    aws_default_security_group.default.id,
    aws_security_group.bastion.id]

  tags = {
    Name = "bastion"
  }
}
