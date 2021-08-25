resource "aws_iam_role_policy" "codedeploy_ec2_instance" {
  name = "EC2-Permissions"
  role = aws_iam_role.codedeploy_ec2_instance_profile.id

  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Action": [
                "s3:Get*",
                "s3:List*"
            ],
            "Effect": "Allow",
            "Resource": "*"
        }
    ]
}
EOF
}
