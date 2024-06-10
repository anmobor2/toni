output "dns_name" {
  value = module.alb.dns_name
}

output "this_lb_arn" {
  value = module.alb.this_lb_arn
}

output "target_group_arns" {
  value = module.alb.target_group_arns
}