module "nlb-internal" {
  source                   = "git::https://github.com/OT-CLOUD-KIT/terraform-aws-nlb.git"
  count                    = var.enable_nlb_resource == true ? 1 : 0
  nlb_name                 = var.nlb_name 
  subnets                  = var.subnets
  subnet_mapping           = var.subnet_mapping
  listener_port            = var.listener_port
  vpc_id                   = var.vpc_id
  target_groups            = var.target_groups
  target_group_instance_id = var.target_group_instance_id
  tcp_protocol             = var.tcp_protocol
  target_type              = var.target_type
  port                     = var.port
  healthy_threshold        = var.healthy_threshold
  unhealthy_threshold      = var.unhealthy_threshold
  interval                 = var.interval
  matcher                  = var.matcher
  load_balancer_type       = var.load_balancer_type
  internal                 = var.internal
  default_action_type      = var.default_action_type 
  target_group_name        = var.target_group_name
  target_group_port        = var.target_group_port
  tg_attachement_port      = var.tg_attachement_port
  tags                     = var.tags
}           



