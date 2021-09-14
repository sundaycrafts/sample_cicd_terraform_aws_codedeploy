// used for service role for codedeploy https://docs.aws.amazon.com/codedeploy/latest/userguide/tutorials-wordpress-deploy-application.html
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

// used for codedeploy agent in EC2 instance https://docs.aws.amazon.com/codedeploy/latest/userguide/getting-started-create-iam-instance-profile.html
// and for installing codedeploy agent via ssm https://docs.aws.amazon.com/codedeploy/latest/userguide/codedeploy-agent-operations-install-ssm.html
// see also https://docs.aws.amazon.com/systems-manager/latest/userguide/setup-instance-profile.html
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
        "Action": "s3:GetObject",
        "Resource": [
            "arn:aws:s3:::aws-ssm-${var.region_dev}/*",
            "arn:aws:s3:::aws-windows-downloads-${var.region_dev}/*",
            "arn:aws:s3:::amazon-ssm-${var.region_dev}/*",
            "arn:aws:s3:::amazon-ssm-packages-${var.region_dev}/*",
            "arn:aws:s3:::region-birdwatcher-prod/*",
            "arn:aws:s3:::aws-ssm-distributor-file-${var.region_dev}/*",
            "arn:aws:s3:::aws-ssm-document-attachments-${var.region_dev}/*",
            "arn:aws:s3:::patch-baseline-snapshot-${var.region_dev}/*"
        ]
    },
    {
        "Effect": "Allow",
        "Action": [
            "s3:GetObject",
            "s3:PutObject",
            "s3:PutObjectAcl",
            "s3:GetEncryptionConfiguration"
        ],
        "Resource": [
          "${aws_s3_bucket.codedeploy_asset.arn}"
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

resource "aws_iam_role_policy_attachment" "codedeploy_ec2_instance_profile" {
  role = aws_iam_role.codedeploy_ec2_instance_profile.name
  policy_arn = data.aws_iam_policy.AmazonSSMManagedInstanceCore.arn
}
