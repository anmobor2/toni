# vpc variables
variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
  default     = "my-vpc"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_azs" {
  description = "Availability Zones for the VPC"
  type        = list(string)
  default     = ["eu-north-1a", "eu-north-1b", "eu-north-1c"]
}

variable "vpc_public_subnets" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_private_subnets" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.20.0/24", "10.0.30.0/24"]
}

variable "vpc_enable_nat_gateway" {
  description = "Enable NAT Gateway for the VPC"
  type        = bool
  default     = true
}

variable "vpc_tags" {
  description = "Tags to apply to the VPC resources"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "project_intely"
  }
}

# autoscalling variables
variable "autoscaling_name" {
  description = "Name of the Auto Scaling group"
  type        = string
}

variable "autoscaling_health_check_type" {
  description = "Type of health check to perform"
  type        = string
  default     = "EC2"
}

variable "autoscaling_health_check_grace_period" {
  description = "Time (in seconds) after instance comes into service before checking health"
  type        = number
  default     = 300
}

variable "autoscaling_launch_template_name" {
  description = "Name of the launch template to use"
  type        = string
}

variable "autoscaling_instance_type" {
  description = "Instance type to use for the launch template"
  type        = string
}

variable "autoscaling_ami" {
  description = "AMI ID to use for the launch template"
  type        = string
}

variable "autoscaling_user_data" {
  description = "User data script to run on instance launch"
  type        = string
  default     = ""
}

variable "autoscaling_min_size" {
  description = "Minimum number of instances in the Auto Scaling group"
  type        = number
}

variable "autoscaling_max_size" {
  description = "Maximum number of instances in the Auto Scaling group"
  type        = number
}

variable "autoscaling_desired_capacity" {
  description = "Desired number of instances in the Auto Scaling group"
  type        = number
}

variable "autoscaling_target_group_arns" {
  description = "List of target group ARNs to associate with the Auto Scaling group"
  type        = list(string)
}

variable "autoscaling_tags" {
  description = "Tags to apply to resources"
  type        = map(string)
}

# alb variables
variable "alb_name" {
  description = "Name of the ALB"
  type        = string
  default     = "my-alb"
}

variable "alb_load_balancer_type" {
  description = "Type of load balancer (application or network)"
  type        = string
  default     = "application"
}

variable "alb_target_groups" {
  description = "Target group configurations for the ALB"
  type        = list(any)
  default     = []
}

variable "alb_http_tcp_listeners" {
  description = "HTTP/TCP listener configurations for the ALB"
  type        = list(any)
  default     = []
}

variable "alb_tags" {
  description = "Tags to apply to the ALB resources"
  type        = map(string)
  default     = {}
}

# albgroup variables
variable "alb_security_group_name" {
  description = "Name of the ALB security group"
  type        = string
  default     = "project_intely-alb-sg"
}

variable "alb_security_group_description" {
  description = "Description of the ALB security group"
  type        = string
  default     = "Security group for ALB"
}

variable "alb_security_group_ingress_cidr_blocks" {
  description = "CIDR blocks for ingress rules"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "alb_security_group_ingress_rules" {
  description = "Ingress rules for the security group"
  type        = list(string)
  default     = ["http-80"]
}

variable "alb_security_group_egress_rules" {
  description = "Egress rules for the security group"
  type        = list(string)
  default     = ["all-all"]
}

variable "alb_security_group_tags" {
  description = "Tags for the ALB security group"
  type        = map(string)
  default = {
    Terraform   = "true"
    Environment = "project_intely"
  }
}

# RDS variables
variable "rds_master_password" {
  description = "The master password for the RDS Aurora cluster"
  type        = string
  sensitive   = true
}

variable "rds_tags" {
  description = "A map of tags to apply to the RDS Aurora resources"
  type        = map(string)
  default     = {}
}

variable "rds_master_username" {
  description = "The master username for the RDS Aurora cluster"
  type        = string
  default     = "admin"
}

# "aws_launch_template" "web_server"
variable "launch_template_name_prefix" {
  description = "The prefix for the launch template name"
  type        = string
  default     = "my-template"
}

variable "launch_template_image_id" {
  description = "The AMI ID for the launch template"
  type        = string
  default     = "ami-02a6bfdcf828430eb"
}

variable "launch_template_instance_type" {
  description = "The instance type for the launch template"
  type        = string
  default     = "t2.micro"
}

variable "launch_template_user_data_file" {
  description = "The path to the user data script file"
  type        = string
  default     = "user_data.sh"
}

variable "launch_template_tags" {
  description = "Tags to apply to the launch template"
  type        = map(string)
  default = {
    Name        = "project_intely-web-server"
    Terraform   = "true"
    Environment = "project_intely"
  }
}

variable "launch_template_volume_size" {
  description = "The size of the root EBS volume (in GB)"
  type        = number
  default     = 1
}

