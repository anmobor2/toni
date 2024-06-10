variable "engine" {
  description = "The database engine to use"
  type        = string
  default     = "aurora-mysql"
}

variable "engine_version" {
  description = "The database engine version"
  type        = string
  default     = "5.7.mysql_aurora.2.07.2"
}

variable "instance_class" {
  description = "The instance class to use"
  type        = string
  default     = "db.t2.small"
}

variable "vpc_id" {
  description = "The VPC ID to create the resources in"
  type        = string
}

variable "subnets" {
  description = "The subnet IDs to create the resources in"
  type        = list(string)
}

variable "create_security_group" {
  description = "Whether to create a security group for the RDS cluster"
  type        = bool
  default     = true
}

variable "database_name" {
  description = "The name of the database to create"
  type        = string
  default     = "mydatabase"
}

variable "master_username" {
  description = "The master username for the database"
  type        = string
  default     = "admin"
}

variable "master_password" {
  description = "The master password for the database"
  type        = string
  sensitive   = true
}

variable "tags" {
  description = "A map of tags to apply to the resources"
  type        = map(string)
  default     = {}
}

variable "autoscaling_security_group_id" {
  description = "The security group ID for the Auto Scaling group instances"
  type        = string
}