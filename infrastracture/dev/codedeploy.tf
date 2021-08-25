resource "aws_codedeploy_app" "app" {
  name = "app"
}

resource "aws_codedeploy_deployment_config" "app" {
  deployment_config_name = "app-deployment-config"

  minimum_healthy_hosts {
    type  = "HOST_COUNT"
    value = 1
  }
}

resource "aws_codedeploy_deployment_group" "app" {
  app_name               = aws_codedeploy_app.app.name
  deployment_group_name  = "app"
  service_role_arn       = var.codedeploy_iam_role_arn
  deployment_config_name = aws_codedeploy_deployment_config.app.id

  // https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-codedeploy-deploymentgroup-tagfilter.html
  ec2_tag_filter {
    key   = "CodedeployGroup"
    type  = "KEY_AND_VALUE"
    value = "app"
  }

//  trigger_configuration {
//    trigger_events     = ["DeploymentFailure"]
//    trigger_name       = "foo-trigger"
//    trigger_target_arn = "foo-topic-arn"
//  }

  auto_rollback_configuration {
    enabled = true
    events  = ["DEPLOYMENT_FAILURE"]
  }

//  alarm_configuration {
//    alarms  = ["my-alarm-name"]
//    enabled = true
//  }
}

