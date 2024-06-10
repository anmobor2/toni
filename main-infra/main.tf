module "vpc" {# arreglado en modules/vpc/main.tf
  source = "./modules/vpc"

  name                = var.vpc_name
  cidr                = var.vpc_cidr
  azs                 = var.vpc_azs
  public_subnets      = var.vpc_public_subnets
  private_subnets     = var.vpc_private_subnets
  enable_nat_gateway  = var.vpc_enable_nat_gateway
  tags                = var.vpc_tags
}

module "autoscaling" {
  source = "./modules/autoscaling"

  name                      = var.autoscaling_name
  vpc_zone_identifier       = module.vpc.public_subnets
  health_check_type         = var.autoscaling_health_check_type
  health_check_grace_period = var.autoscaling_health_check_grace_period

  launch_template_name   = var.autoscaling_launch_template_name
  instance_type          = var.autoscaling_instance_type
  ami                    = var.autoscaling_ami
  user_data              = var.autoscaling_user_data

  min_size         = var.autoscaling_min_size
  max_size         = var.autoscaling_max_size
  desired_capacity = var.autoscaling_desired_capacity

  target_group_arns = var.autoscaling_target_group_arns 

  tags = var.autoscaling_tags
}


module "alb" {
  source = "./modules/alb"

  name               = var.alb_name
  load_balancer_type = var.alb_load_balancer_type

  subnets = module.vpc.public_subnets

  target_groups = var.alb_target_groups

  http_tcp_listeners = var.alb_http_tcp_listeners

  tags = var.alb_tags
  security_group_id = module.alb_security_group.security_group_id
}

module "alb_security_group" {
  source = "./modules/alb_security_group"

  name        = var.alb_security_group_name
  description = var.alb_security_group_description
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.alb_security_group_ingress_cidr_blocks
  ingress_rules       = var.alb_security_group_ingress_rules

  egress_rules = var.alb_security_group_egress_rules

  tags = var.alb_security_group_tags
}

resource "aws_launch_template" "web_server" {
  name_prefix   = var.launch_template_name_prefix
  image_id      = var.launch_template_image_id
  instance_type = var.launch_template_instance_type

  user_data = file(var.launch_template_user_data_file)

  tags = var.launch_template_tags

  block_device_mappings {
    device_name = "/dev/sda1"

    ebs {
      volume_size = var.launch_template_volume_size
    }
  }
}

module "rds" {
  source = "./modules/rds"

  vpc_id             = module.vpc.vpc_id
  subnets            = module.vpc.private_subnets
  master_username    = var.rds_master_username
  master_password    = var.rds_master_password
  tags               = var.rds_tags

  autoscaling_security_group_id = module.autoscaling.this_autoscaling_group_security_group_id
}