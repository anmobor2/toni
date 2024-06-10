  autoscaling_name                      = "my-asg"
  autoscaling_vpc_zone_identifier       = module.vpc.public_subnets
  autoscaling_health_check_type         = "EC2"
  autoscaling_health_check_grace_period = 300

  autoscaling_launch_template_name      = aws_launch_template.web_server.name
  autoscaling_launch_template_version   = aws_launch_template.web_server.latest_version
  autoscaling_instance_type             = "t2.micro"
  autoscaling_ami                       = "ami-0c94855ba95c71c99"
  autoscaling_user_data                 = base64encode(data.template_file.user_data.rendered)

  autoscaling_min_size         = 1
  autoscaling_max_size         = 3
  autoscaling_desired_capacity = 1

  autoscaling_target_group_arns = [module.alb.target_group_arns["project-intely-tg"]]

  autoscaling_tags = {
    Terraform   = "true"
    Environment = "project_intely"
  }
