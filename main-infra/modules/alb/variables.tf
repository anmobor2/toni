variable "name" {
  description = "Name of the ALB"
  type        = string
}

variable "load_balancer_type" {
  description = "Type of load balancer (application or network)"
  type        = string
}

variable "subnets" {
  description = "Subnets to deploy the ALB"
  type        = list(string)
}

variable "target_groups" {
  description = "Target group configurations for the ALB"
  type        = list(any)
}

variable "http_tcp_listeners" {
  description = "HTTP/TCP listener configurations for the ALB"
  type        = list(any)
}

variable "tags" {
  description = "Tags to apply to the ALB resources"
  type        = map(string)
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the ALB"
  type        = string
}