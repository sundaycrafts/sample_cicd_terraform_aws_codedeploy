// Code Deploy
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

// System Manager https://docs.aws.amazon.com/systems-manager/latest/userguide/setup-create-users-nonadmin-groups.html
resource "aws_iam_group" "system_manger" {
  name = "system_manager"
}

resource "aws_iam_group_membership" "system_manager" {
  name = "system_manager"
  users = [aws_iam_user.system_manager.name]
  group = aws_iam_group.system_manger.name
}

resource "aws_iam_group_policy_attachment" "system_manager" {
  for_each = toset([
    data.aws_iam_policy.AmazonSSMFullAccess.arn,
    data.aws_iam_policy.ResourceGroupsandTagEditorFullAccess.arn,
  ])

  group = aws_iam_group.system_manger.name
  policy_arn = each.value
}
