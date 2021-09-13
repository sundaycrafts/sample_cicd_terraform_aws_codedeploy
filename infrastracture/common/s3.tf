resource "aws_s3_bucket" "codedeploy_asset" {
  bucket = "codedeploy-asset"

  tags = {
    Name = "codedeploy-asset"
  }
}