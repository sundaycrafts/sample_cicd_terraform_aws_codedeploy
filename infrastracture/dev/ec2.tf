resource "aws_instance" "app1" {
  provider = aws.dev

  subnet_id = aws_subnet.app1.id

  ami = local.ami.ubuntucustomnode
  instance_type = "t2.micro"
  key_name = aws_key_pair.app1.key_name

  iam_instance_profile = var.codedeploy_instance_profile_name

  vpc_security_group_ids = [
    aws_default_security_group.default.id]

  tags = {
    Name = "app1"
  }
}

resource "aws_instance" "app2" {
  provider = aws.dev

  subnet_id = aws_subnet.app2.id

  ami = local.ami.ubuntucustomnode
  instance_type = "t2.micro"
  key_name = aws_key_pair.app2.key_name

  iam_instance_profile = var.codedeploy_instance_profile_name

  vpc_security_group_ids = [
    aws_default_security_group.default.id]

  tags = {
    Name = "app2"
  }
}

resource "aws_instance" "bastion" {
  provider = aws.dev

  subnet_id = aws_subnet.dmz1.id

  ami = local.ami.ubuntu20042lts
  instance_type = "t2.micro"
  key_name = aws_key_pair.bastion.key_name

  vpc_security_group_ids = [
    aws_default_security_group.default.id,
    aws_security_group.bastion.id]

  tags = {
    Name = "bastion"
  }
}
