output "nlb_arn" {
  value       = aws_lb.nlb.arn
  description = "ARN of the Network Load Balancer"
}

output "nlb_dns_name" {
  value       = aws_lb.nlb.dns_name
  description = "DNS name of the NLB"
}

output "nlb_target_group_arns" {
  value       = { for k, v in aws_lb_target_group.tg : k => v.arn }
  description = "Map of target group ARNs keyed by port"
}

output "nlb_listener_arns" {
  value       = { for k, v in aws_lb_listener.listener : k => v.arn }
  description = "Map of listener ARNs keyed by port"
}

output "nlb_sg_id" {
  value       = var.create_sg && var.enable_sg_support ? aws_security_group.nlb_sg[0].id : null
  description = "Security group ID used for NLB (if created)"
}
