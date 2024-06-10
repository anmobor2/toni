provider "aws" {
  region = "us-west-2"
}


module "autoscaling" {
  source  = "terraform-aws-modules/autoscaling/aws"
  version = "6.2.0"

  name                      = var.name
  vpc_zone_identifier       = var.vpc_zone_identifier
  health_check_type         = var.health_check_type
  health_check_grace_period = var.health_check_grace_period

  launch_template = {
    id      = aws_launch_template.web_server.id
    version = aws_launch_template.web_server.latest_version
  }

  min_size         = var.min_size
  max_size         = var.max_size
  desired_capacity = var.desired_capacity

  target_group_arns = var.target_group_arns
  tags = var.tags
}

