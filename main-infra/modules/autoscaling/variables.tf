variable "name" {
  type = string
}

variable "vpc_zone_identifier" {
  type = list(string)
}

variable "health_check_type" {
  type = string
}

variable "health_check_grace_period" {
  type = number
}

variable "launch_template_name" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "ami" {
  type = string
}

variable "user_data" {
  type = string
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "desired_capacity" {
  type = number
}

variable "target_group_arns" {
  type = list(string)
}

variable "tags" {
  type = map(string)
}

# RDS variables
variable "rds_instance_class" {
  description = "The instance class for the RDS Aurora instances"
  type        = string
  default     = "db.t2.small"
}

variable "rds_engine" {
  description = "The database engine for the RDS Aurora instances"
  type        = string
  default     = "aurora-mysql"
}

variable "rds_engine_version" {
  description = "The database engine version for the RDS Aurora instances"
  type        = string
  default     = "5.7.mysql_aurora.2.07.2"
}

variable "rds_tags" {
  description = "A map of tags to apply to the RDS Aurora instances"
  type        = map(string)
  default     = {}
}