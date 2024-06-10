alb_name               = "project-intely-alb"
alb_load_balancer_type = "application"

alb_target_groups = [
  {
    name             = "project-intely-tg"
    backend_protocol = "HTTP"
    backend_port     = 80
    target_type      = "instance"
  }
]

alb_http_tcp_listeners = [
  {
    port     = 80
    protocol = "HTTP"
  }
]

alb_tags = {
  Terraform   = "true"
  Environment = "project_intely"
  Project     = "intely"
}