output "target_group_arn" {
  description = "The ARN associated with the target group on the NLB"
  value       = aws_lb_target_group.tg_ip.arn
}

output "target_id" {
  description = "target ids"
  value       = aws_lb_target_group_attachment.tg_attachement.target_id
}

output "load_balancer_arn" {
  description = "The ARN associated on the NLB"
  value       = aws_lb.nlb-internal.arn
}