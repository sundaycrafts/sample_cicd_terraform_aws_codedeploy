resource "aws_iam_user" "codedeploy" {
  name = "codedeploy"

  tags = {
    bot = "true"
    infrastructure = "true"
  }
}

resource "aws_iam_user" "system_manager" {
  name = "system_manager"

  tags = {
    bot = "true"
    infrastructure = "true"
  }
}
