alb_security_group_name        = "project-intely-alb-sg"
alb_security_group_description = "Security group for Project Intely ALB"
alb_security_group_ingress_cidr_blocks = ["0.0.0.0/0"]
alb_security_group_ingress_rules       = ["http-80", "https-443"]
alb_security_group_egress_rules        = ["all-all"]
alb_security_group_tags = {
  Terraform   = "true"
  Environment = "project_intely"
  Project     = "intely"
}