resource "aws_iam_role" "codedeploy_service_role" {
  name = "CodeDeployServiceRole"

  assume_role_policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "Service": [
                    "codedeploy.amazonaws.com"
                ]
            },
            "Action": "sts:AssumeRole"
        }
    ]
}
  EOF
}

resource "aws_iam_role_policy_attachment" "codedeploy" {
  role = aws_iam_role.codedeploy_service_role.name
  policy_arn = data.aws_iam_policy.AWSCodeDeployRole.arn
}

resource "aws_iam_role" "codedeploy_ec2_instance_profile" {
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
      {
          "Sid": "",
          "Effect": "Allow",
          "Principal": {
              "Service": "ec2.amazonaws.com"
          },
          "Action": "sts:AssumeRole"
      }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "codedeploy_ec2_instance_profile" {
  role = aws_iam_role.codedeploy_ec2_instance_profile.name
  policy_arn = data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn
}
