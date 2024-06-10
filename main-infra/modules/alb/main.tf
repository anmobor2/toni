provider "aws" {
  region = "us-west-2"
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.0.0"

  name               = var.name
  load_balancer_type = var.load_balancer_type

  subnets = var.subnets

  target_groups = var.target_groups

  http_tcp_listeners = var.http_tcp_listeners

  tags = var.tags
  security_groups = [module.alb_security_group.security_group_id]
}