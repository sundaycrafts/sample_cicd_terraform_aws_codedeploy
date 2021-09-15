resource "aws_iam_instance_profile" "codedeploy_ec2_instance_profile" {
  name = "EC2-Instance-Profile"
  role = aws_iam_role.codedeploy_ec2_instance_profile.name
}
