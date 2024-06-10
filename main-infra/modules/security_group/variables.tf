variable "name" {
  description = "Name of the security group"
  type        = string
}

variable "description" {
  description = "Description of the security group"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where the security group will be created"
  type        = string
}

variable "ingress_cidr_blocks" {
  description = "List of CIDR blocks allowed to access"
  type        = list(string)
}

variable "ingress_rules" {
  description = "List of ingress rules"
  type        = list(string)
}

variable "egress_rules" {
  description = "List of egress rules"
  type        = list(string)
}

variable "tags" {
  description = "Tags to apply to the security group"
  type        = map(string)
}