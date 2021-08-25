resource "aws_iam_group" "codedeploy" {
  name = "codedeploy"
}

resource "aws_iam_group_membership" "codedeploy" {
  name = "codedeploy"
  users = [aws_iam_user.codedeploy.name]
  group = aws_iam_group.codedeploy.name
}

resource "aws_iam_group_policy_attachment" "codedeploy" {
  group = aws_iam_group.codedeploy.name
  policy_arn = aws_iam_policy.codedeploy.arn
}
