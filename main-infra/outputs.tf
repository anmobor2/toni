# root/outputs.tf
output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = module.alb.lb_dns_name
}

output "alb_public_ip" {
  description = "The public IP address of the ALB"
  value       = module.alb.lb_public_ip
}