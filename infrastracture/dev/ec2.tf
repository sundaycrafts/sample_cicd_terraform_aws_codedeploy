resource "aws_instance" "app_server" {
  provider = aws.dev

  ami = "ami-09e67e426f25ce0d7"
  instance_type = "t2.micro"

  tags = {
    Name = "ExampleAppServerInstance"
  }
}
