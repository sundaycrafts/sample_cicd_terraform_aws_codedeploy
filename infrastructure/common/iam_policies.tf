data "aws_iam_policy" "AWSCodeDeployRole" {
  name = "AWSCodeDeployRole"
  arn = "" // arn:aws:iam::aws:policy/service-role/AWSCodeDeployRole
}

data "aws_iam_policy" "ResourceGroupsandTagEditorFullAccess" {
  name = "ResourceGroupsandTagEditorFullAccess"
  arn = ""
}

data "aws_iam_policy" "AmazonSSMFullAccess" {
  name = "AmazonSSMFullAccess"
  arn = ""
}

data "aws_iam_policy" "AmazonSSMManagedInstanceCore" {
  name = "AmazonSSMManagedInstanceCore"
  arn = "" // arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore
}

resource "aws_iam_policy" "codedeploy" {
  name = "CodeDeployPolicy"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement" : [
    {
      "Effect" : "Allow",
      "Action" : [
        "autoscaling:*",
        "codedeploy:*",
        "ec2:*",
        "lambda:*",
        "ecs:*",
        "elasticloadbalancing:*",
        "iam:AddRoleToInstanceProfile",
        "iam:AttachRolePolicy",
        "iam:CreateInstanceProfile",
        "iam:CreateRole",
        "iam:DeleteInstanceProfile",
        "iam:DeleteRole",
        "iam:DeleteRolePolicy",
        "iam:GetInstanceProfile",
        "iam:GetRole",
        "iam:GetRolePolicy",
        "iam:ListInstanceProfilesForRole",
        "iam:ListRolePolicies",
        "iam:ListRoles",
        "iam:PassRole",
        "iam:PutRolePolicy",
        "iam:RemoveRoleFromInstanceProfile",
        "s3:*",
        "ssm:*"
      ],
      "Resource" : "*"
    }
  ]
}
EOF
}
