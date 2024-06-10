output "security_group_id" {
  description = "ID of the security group"
  value       = module.alb_security_group.security_group_id
}