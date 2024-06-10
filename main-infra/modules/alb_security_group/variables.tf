variable "name" {
  description = "Name of the ALB security group"
  type        = string
}

variable "description" {
  description = "Description of the ALB security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the security group"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "CIDR blocks for ingress rules"
  type        = list(string)
}

variable "ingress_rules" {
  description = "Ingress rules for the security group"
  type        = list(string)
}

variable "egress_rules" {
  description = "Egress rules for the security group"
  type        = list(string)
}

variable "tags" {
  description = "Tags for the ALB security group"
  type        = map(string)
}