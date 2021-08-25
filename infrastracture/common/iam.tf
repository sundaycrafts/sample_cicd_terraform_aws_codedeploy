resource "aws_iam_user" "codedeploy" {
  name = "codedeploy"

  tags = {
    bot = "true"
    infrastructure = "true"
  }
}
