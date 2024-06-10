
vpc_name                = "project-intely-vpc"
vpc_cidr                = "10.1.0.0/16"
vpc_azs                 = ["eu-north-1a", "eu-north-1b"]
vpc_public_subnets      = ["10.1.1.0/24", "10.1.2.0/24"]
vpc_private_subnets     = ["10.1.10.0/24", "10.1.20.0/24"]
vpc_enable_nat_gateway  = false
vpc_tags = {
  Terraform   = "true"
  Environment = "project_intely"
  Project     = "intely"
}