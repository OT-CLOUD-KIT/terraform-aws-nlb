output "nlb_dns" {
  value = module.nlb.nlb_dns_name
}

output "nlb_tg_arns" {
  value = module.nlb.nlb_target_group_arns
}

output "nlb_listener_arns" {
  value = module.nlb.nlb_listener_arns
}

output "nlb_sg_id" {
  value = module.nlb.nlb_sg_id
}