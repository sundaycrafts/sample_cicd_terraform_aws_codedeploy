resource "aws_instance" "app_server" {
  provider = aws.prod

  ami = "ami-0194c3e07668a7e36"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}

