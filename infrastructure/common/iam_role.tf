// used for service role for CodeDeploy (not its agent)
// see https://docs.aws.amazon.com/codedeploy/latest/userguide/tutorials-wordpress-deploy-application.html
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

// the statement and assume statement is for CodeDeploy agent in EC2 instance
// see https://docs.aws.amazon.com/codedeploy/latest/userguide/getting-started-create-iam-instance-profile.html
resource "aws_iam_role" "codedeploy_ec2_instance_profile" {
  name = "codedeploy_ec2_instance_profile"

  inline_policy {
    name = "SSMInstanceProfileS3Policy"
    policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
        "Effect": "Allow",
        "Action": [
            "s3:Get*",
            "s3:List*"
        ],
        "Resource": [
          "${aws_s3_bucket.codedeploy_asset.arn}/*",
          "arn:aws:s3:::aws-codedeploy-${var.region_dev}/*"
        ]
    }
  ]
}
EOF
  }

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

# Attach policy to enable an instance to use SSM core functionality
resource "aws_iam_role_policy_attachment" "codedeploy_ec2_instance_profile" {
  role = aws_iam_role.codedeploy_ec2_instance_profile.name
  policy_arn = data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn
}
