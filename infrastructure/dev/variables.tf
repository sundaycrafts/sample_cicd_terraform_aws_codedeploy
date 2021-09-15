variable "vpc_id" {
  type = string
}

variable "azs" {
  description = "availability zones"
  type = list(string)
}

variable "codedeploy_instance_profile_name" {
  type = string
}

variable "codedeploy_iam_role_arn" {
  type = string
}
